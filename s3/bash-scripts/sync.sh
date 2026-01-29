#!/bin/bash
set -e
# File storage
OUTPUT_DIR="/tmp/s3-bashscripts"
rm -r $OUTPUT_DIR
mkdir -p $OUTPUT_DIR
NUM_FILES=$((RANDOM % 6 + 5))


for ((i = 1; i <= $NUM_FILES; i++)); do
FILENAME="$OUTPUT_DIR/file_$i.txt"
#Generate random data nad write to a file
dd if=/dev/urandom of="$FILENAME" bs=1024 count=$((RANDOM % 1024 + 1)) 2>/dev/null
done

tree $OUTPUT_DIR

