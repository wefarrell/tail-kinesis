# tail-kinesis
shell script that prints the output of all records in a kinesis shard and tails for new records

# Requirements: 
- jq
- aws cli

# Instructions
Download the requirements and run `aws configure` to add your credentials. Replace 'your stream name with the name of the stream you wish to inspect' Then run `./kinesis_records.sh` and it will print out the contents of the 0th shard (shardId-000000000000) and any new records as they come in.

If you only want to print new records change the --shard-iterator-type option from TRIM_HORIZON to LATEST
