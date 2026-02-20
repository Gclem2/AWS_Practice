#!/bin/bash
set -e 
#https://docs.aws.amazon.com/cli/latest/reference/s3api/delete-bucket.html

if [ -z "$1" ]; then
  echo "There needs to be a bucket name eg ./bucket my-bucket-name"
  exit 1
fi
BUCKET_NAME=$1
echo "Deleting bucket $BUCKET_NAME..."
aws s3api delete-bucket \
--bucket $BUCKET_NAME \
