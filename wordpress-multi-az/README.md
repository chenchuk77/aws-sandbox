
## Wordpress Multi-AZ deployment
Example of VPC with RDS multi AZ. 
Taken from AWS examples with some modifications :

* Create a VPC with 2 subnets in a different availability-zone 
  ```
  aws cloudformation create-stack \
      --stack-name stack-vpc-temp \
      --template-body file://vpc-multi-az.template \
      --parameters file://vpc-multi-az.json \
      --capabilities CAPABILITY_IAM \
      --disable-rollback
  ```

* Deploy Wordpress with ASG/ALB and multi-AZ RDS instance:

  ```
  aws cloudformation create-stack \
      --stack-name stack-aws-wpmaz-temp \
      --template-body file://WordPress_Multi_AZ.template \
      --parameters file://WordPress_Multi_AZ.json \
      --capabilities CAPABILITY_IAM \
      --disable-rollback
  ```
