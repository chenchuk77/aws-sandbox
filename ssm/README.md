# SSM
AWS Systems Manager (formerly known as SSM) is an AWS service that you can use to view and control your infrastructure on AWS. Using the Systems Manager console, you can view operational data from multiple AWS services and automate operational tasks across your AWS resources.

### Working with SSM Documents
Get a list:
```
aws ssm list-documents
aws ssm list-documents \
    --filters Key=Owner,Values=Public \
    --output yaml > ssm.list.yaml
```
Query item (ssm doc) :
```
# AWS docs started with AWS*
aws ssm describe-document \
    --name AWSFIS-Run-Memory-Stress

# Public docs use ARN's (Not tested! shown as example ONLY)
aws ssm describe-document \
    --name arn:aws:ssm:eu-west-1:185030254733:document/nak2k-InstallNode
```
Query item content (execution steps/code):
```
aws ssm get-document \
    --name AWS-ConfigureDocker \
    --output yaml
    
# converting jsonstring to json (Content is jsonstring)    
aws ssm get-document \
    --name AWS-UpdateCloudFormationStackWithApproval \
    --output json | jq '.Content|fromjson'
```

Create Managed-Instance (Managed by SSM):
```
aws cloudformation create-stack \
    --stack-name stack-mi-temp \
    --template-body file://ManagedInstanceForSSM.template \
    --parameters file://ManagedInstanceForSSM.json \
    --capabilities CAPABILITY_IAM 
```

### Add Wordpress to ASG using SSM document
```
aws ssm start-automation-execution \
    --document-name "LaunchAndAttachToAsg" \
    --document-version "\$DEFAULT" \
    --parameters '{"LaunchTemplateName":["WpLaunchTemplate-temp"],"AutoScallingGroupName":["stack-aws-wpmaz-temp-WebServerGroup-WZ32T2YOMK0I"],"OperatorEMail":["chenchuk@gmail.com"],"KeyName":["key-wp-temp"],"Subnets":["subnet-0f518055ebe79abba,subnet-0910c7a5b65d2b4a7"],"DBPassword":["12345678"],"VpcId":["vpc-0933596d51f662ca0"],"DbSubGroup":["chen-temp-eu-west-1-dbsg"],"DBUser":["user"]}' \
    --region eu-west-1
```

### Increase RDS Storage
```
aws ssm start-automation-execution \
    --document-name "AddRdsStorage" \
    --document-version "\$DEFAULT" \
    --parameters '{"AdditionalStorage":["10"],"DBInstanceIdentifier":["sdzota1zoam2an"]}' \
    --region eu-west-1
```
