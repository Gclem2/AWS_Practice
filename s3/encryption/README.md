## Create a bucket
```sh 
aws s3 mb s3://encryption-fun-bc-143
```

## Create a file
```sh 
echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://encryption-fun-bc-143
```

## Put Object with encryption of SS3-KMS
```bash
aws s3api put-object  \
--bucket encryption-fun-bc-143 \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms \
--ssekms-key-id "keyname"
```

## Put Object with SSE-C (Failed)
```sh 
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)

echo $BASE64_ENCODED_KEY

export MD5_VALUE=$(echo $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64)
echo $MD5_VALUE

aws s3api put-object \
--bucket encryption-fun-bc-143 \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES25 \
--sse-customer-key $BASE64_ENCODED_KEY \
--sse-customer-key-md5 $MD5_VALUE
```
