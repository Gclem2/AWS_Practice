## Create a bucket
```sh 
aws s3 mb s3://cors-fun-bc-4223

```
## Change block public access
```sh 
aws s3api put-public-access-block \
    --bucket amzn-s3-demo-bucket \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-fun-bc-4223 --policy file://~/Projects/AWS_Practice/s3/cors/policy.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-fun-bc-4223 --website-configuration file://~/Projects/AWS_Practice/s3/cors/website.json
```

## Upload our index.html file and include  resource that would be cross-orgin
```sh
aws s3 cp index.html s3://cors-fun-bc-4223
```

## View the website and see if the index.html is there.
http://cors-fun-bc-4223.s3-website-us-east-1.amazonaws.com

## Apply a CORS policy

