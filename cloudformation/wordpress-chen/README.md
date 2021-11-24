
#
# This file contains some cloudformation examples
#

### create ssh key-pair
```
aws ec2 create-key-pair \
    --key-name wp-key-temp \
    --output text > wp-key-temp.private
```

### create stack
```
aws cloudformation create-stack \
    --stack-name wp-stack-chen \
    --template-body file://wp-template.json \
    --parameters file://wp-params.json
```

### update stack (v2 contains tags)
```
aws cloudformation update-stack \
    --stack-name wp-stack-chen \
    --template-body file://wp-template-v2.json \
    --parameters file://wp-params.json
```

### delete stack
```
aws cloudformation delete-stack \
    --stack-name wp-stack-chen
```

### get stack outputs
```
aws cloudformation describe-stacks \
    --stack-name wp-stack-chen |\
    jq '.Stacks[0].Outputs[0]'
```

### ssh (private-key file need to be editted, ip should be changed)
```
ssh -i wp-key-temp.private ec2-user@54.228.22.149
```

### test http
```
curl $(aws cloudformation describe-stacks \
    --stack-name wp-stack-chen |\
    jq -r '.Stacks[0].Outputs[0].OutputValue')
```

