#!/bin/bash

echo "== delete stack CFN"

STACK_NAME="cfn-s3-simple"

aws cloudformation delete-stack \
--stack-name $STACK_NAME \
--region us-east-1

