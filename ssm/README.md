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
    --filters Key=Owner,Values=Public --output yaml\
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
    --name arn:aws:ssm:eu-west-1:185030254733:document/nak2k-InstallNode \
    > ssm.item.public.InstallNode.output.yml

```
query item content (execution steps/code):
```
aws ssm get-document \
    --name AWS-ConfigureDocker \
    --output yaml
    
# converting jsonstring to json (Content is jsonstring)    
aws ssm get-document \
    --name AWS-UpdateCloudFormationStackWithApproval \
    --output json | jq '.Content|fromjson'

```




create a managed-instance:
1. create iam-profile (done with aws-console)
   * NOTE: AWS console shows 'SSM-ROLE' but not 'IAM Profile' (which is NOT the same) 
   this can be shows from awscli.
* TODO: create iam profile using cloudformation
* TODO: add s3 bucket + role
2. launch instance with the attached iam-profile
3. manage the instance from AWS Network-Manager (SSM service)
```
 aws cloudformation create-stack \
      --stack-name stack-mi-temp \
      --template-body file://managed-instance.template \
      --parameters file://managed-instance.json \
      --capabilities CAPABILITY_IAM \
      --disable-rollback

```



aws cloudformation describe-stacks \
--stack-name stack-wp-temp \
--query "Stacks[0].Outputs[?OutputKey=='WebsiteURL'].OutputValue" \
--output text

VPC=$(aws cloudformation describe-stacks --stack-name stack-vpc-rds-temp --query "Stacks[0].Outpu
ts[?OutputKey=='VpcId'].OutputValue" --output text)



ssm invocation from aws console web:
https://eu-west-1.console.aws.amazon.com/systems-manager/automation/execute/ChenAutomation-temp?region=eu-west-1#OperatorEMail=chenchuk%40gmail.com&KeyName=key-wp-temp&Subnets=subnet-0b673e71c731327e9%2Csubnet-010e508e4953d5b73&DBPassword=12345678&VpcId=vpc-044ad0afeadb36ca0&DbSubGroup=chen-temp-eu-west-1-dbsg&DBUser=user&cfnStack=stack-aws-wpmaz-temp&tagsOnCreate=%5B%5D


SSM templates to check :
AWS-HelloWorld
AWS-HelloWorldChangeTemplate
AWS-StopEC2Ins
AWS-StopEC2InstanceWithApprovaltance
AWS-TerminateEC2InstanceWithApproval
AWSSupport-CopyEC2Instance
AWSSupport-ListEC2Resources
AWSSupport-SetupIPMonitoringFromVPC

AWSResilienceHub-InjectCpuLoadInAsgTest_2021-09-22
AWSResilienceHub-ScaleOutAsgSOP_2020-07-01

arn:aws:ssm:eu-west-1:605677978325:document/SSM_Apache
arn:aws:ssm:eu-west-1:536253303170:document/FIS-ARS-RemoveHTTP500
arn:aws:ssm:eu-west-1:536253303170:document/FIS-ARS-HTTP500
arn:aws:ssm:eu-west-1:536253303170:document/FIS-ARS-AddHTTP500



