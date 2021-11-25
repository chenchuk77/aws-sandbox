# SSM
AWS Systems Manager (formerly known as SSM) is an AWS service that you can use to view and control your infrastructure on AWS. Using the Systems Manager console, you can view operational data from multiple AWS services and automate operational tasks across your AWS resources.


### Names and examples
* Systems Manager Agent: SSM Agent
* Systems Manager parameters: SSM parameters
* Systems Manager service endpoints: ssm.us-east-2.amazonaws.com
* AWS CloudFormation resource types: AWS::SSM::Document
* AWS Config rule identifier: EC2_INSTANCE_MANAGED_BY_SSM
* AWS Command Line Interface (AWS CLI) commands: aws ssm describe-patch-baselines
* AWS Identity and Access Management (IAM) managed policy names: AmazonSSMReadOnlyAccess
* Systems Manager resource ARNs: arn:aws:ssm:us-east-2:111222333444:patchbaseline/pb-07d8884178EXAMPLE

#### ssm documents (private/public [aws/community])

get list:
```
# get a list
aws ssm list-documents \
    --profile chenal \
    > ssm.list.output.yaml

aws ssm list-documents \
    --profile chenal \
    --filters Key=Owner,Values=Public \
    > ssm.list.public.ouput.yaml
```


query item (ssm doc) :
```
# AWS docs started with AWS*
aws ssm describe-document \
    --profile chenal \
    --output yaml \
    --name AWS-ConfigureCloudWatchOnEC2Instance \
    > ssm.item.AWS-ConfigureCloudWatchOnEC2Instance.output.yaml
    
aws ssm describe-document \
    --profile chenal \
    --output yaml \
    --name AWSFIS-Run-Memory-Stress \
    > ssm.item.AWSFIS-Run-Memory-Stress.output.yaml

# public docs use ARN's
aws ssm describe-document \
    -- name arn:aws:ssm:eu-west-1:185030254733:document/nak2k-InstallNode

```


