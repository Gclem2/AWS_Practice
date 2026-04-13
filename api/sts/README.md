## Create a user with no permissions
We need to create a new user with no permissions and generae out access keys
```sh 
aws iam create-user --user-name stsmachine-user
aws iam create-access-key --user-name stsmachine-user --output table

aws configure
```
Test who you ----------
``` 
```
```
```
## Create a role

We need to create a role that will access a new resource

## Use new user credentials and assume role
```sh 
aws iam put-user-policy \
--user-name stsmachine-user \
--policy-name StsAssumePolicy \
--policy-document file://~/Projects/AWS_Practice/api/sts/policy.json
```
```sh 
aws sts assume-role \
--role-arn arn:aws:iam::835238336296:role/my-sts-fun-stack-StsRole-k0bQfkwFXqzI \
--role-session-name s3-sts-fun \
--profile sts
```


