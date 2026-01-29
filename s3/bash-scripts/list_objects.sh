#!/bin/bash
#https://docs.aws.amazon.com/cli/latest/reference/s3api/create-bucket.html

if [ -z "$1" ]; then
  echo "There needs to be a bucket name eg ./bucket my-bucket-name"
  exit 1
fi
BUCKET_NAME=$1
echo "Listing objects $BUCKET_NAME..."
aws s3api list-objects-v2 \
--bucket $BUCKET_NAME \


