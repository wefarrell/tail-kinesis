iterator=`aws kinesis get-shard-iterator --shard-id shardId-000000000000 --shard-iterator-type TRIM_HORIZON --stream-name ddex_into_kinesis_datastream | jq -r '.ShardIterator'`
millis_behind=1
while :
do
    response=`aws kinesis get-records --shard-iterator $iterator`
    echo $response | jq -r '.Records | .[] | .Data' | while read line ; do
        echo $line | base64 -D; printf "\n";
    done
    iterator=`echo $response | jq -r '.NextShardIterator'`
    millis_behind=`echo $response | jq -r '.MillisBehindLatest'`
    if [ $millis_behind == 0  ]; then
        sleep 2
    fi
