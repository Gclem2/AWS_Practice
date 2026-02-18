#!/bin/bash
set -e
# File storage
OUTPUT_DIR="/tmp/s3-bashscripts"
rm -r $OUTPUT_DIR
mkdir -p $OUTPUT_DIR

# generate a random number
# to determine how many files to create
NUM_FILES=$((RANDOM % 6 + 5))



if [ -z "$1" ]; then
  echo "There needs to be a bucket name eg ./bucket my-bucket-name"
  exit 1
fi
  
if [ -z "$2" ]; then
  echo "There needs to be a bucket name eg ./bucket my-bucket-name"
  exit 1
fi

BUCKETNAME=$1
FILENAME_PREFIX=$2

for ((i = 1; i <= $NUM_FILES; i++)); do
  # generate random file name
FILENAME="$OUTPUT_DIR/${FILENAME_PREFIX}_$i.txt"
#Generate random data nad write to a file
dd if=/dev/urandom of="$FILENAME" bs=1024 count=$((RANDOM % 1024 + 1)) 2>/dev/null
done

tree $OUTPUT_DIR

