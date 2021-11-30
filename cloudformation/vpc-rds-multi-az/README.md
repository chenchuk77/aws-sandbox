
## vpc-rds
Example of VPC with RDS multi AZ. Taken from AWS examples with some modifications :

* Networking prerequisites:
  ```
  aws cloudformation create-stack \
      --stack-name stack-vpc-rds-temp \
      --template-body file://vpc-rds-multi-az.template \
      --parameters file://vpc-rds-multi-az.json \
      --capabilities CAPABILITY_IAM \
      --disable-rollback
  ```

* Wordpress with ASG/ALB and multi-AZ RDS instance:

  ```
  aws cloudformation create-stack \
      --stack-name stack-aws-wpmaz-temp \
      --template-body file://WordPress_Multi_AZ.template \
      --parameters file://WordPress_Multi_AZ.json \
      --capabilities CAPABILITY_IAM \
      --disable-rollback
  ```

* Example of dependent stacks using import/export
  ```
  aws cloudformation create-stack \
      --stack-name stack-sub3-temp \
      --template-body file://subnet3.template \
      --parameters ParameterKey=VpcStack,ParameterValue=stack-vpc-rds-temp
  ```