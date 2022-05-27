# Multiple AWS Accounts with Terraform and Terragrunt

[Source]|(https://github.com/cobusbernard/hashitalks-africa-demo)

Testing of AWS multi account for S3 buckets


Run as user [works]

Run as role [checking]
```
echo "Using $AWS_PROFILE user"
aws sts get-caller-identity

subaccount=955192890155
nameOfMyrole=OrganizationAccountAccessRole
aws_credentials=$(aws sts assume-role --role-arn arn:aws:iam::${subaccount}:role/${nameOfMyrole} --role-session-name "RoleSession1" --output json)

export AWS_ACCESS_KEY_ID=$(echo $aws_credentials|jq '.Credentials.AccessKeyId'|tr -d '"')
export AWS_SECRET_ACCESS_KEY=$(echo $aws_credentials|jq '.Credentials.SecretAccessKey'|tr -d '"')
export AWS_SESSION_TOKEN=$(echo $aws_credentials|jq '.Credentials.SessionToken'|tr -d '"')

echo "Using $nameOfMyrole Role"
aws sts get-caller-identity
```