# tail-kinesis
shell script that prints the output of all records in a kinesis shard and tails for new records

# Requirements: 
- jq
- aws cli

# Instructions
Download the requirements and run `aws configure` to add your credentials. Then run `./kinesis_records.sh` and it will print out the contents of the 0th shard (shardId-000000000000) and any new records as they come in.
