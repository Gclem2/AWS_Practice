## Create a bucket
aws s3 mb s3://bucket-policy-example-bc-1345

##

 aws s3api put-bucket-policy --bucket bucket-policy-example-bc-1345 --policy file://policy.json
