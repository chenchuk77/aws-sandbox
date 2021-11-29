
## vpc-rds

* Example of VPC with RDS multi AZ.
* NOTE: this is a prerequisite infra for amazon template: WordPress_Multi_AZ.template

  ```
  aws cloudformation create-stack \
      --stack-name stack-vpc-rds-temp \
      --template-body file://vpc-rds-multi-az.template \
      --parameters file://vpc-rds-multi-az.json \
      --capabilities CAPABILITY_IAM \
      --disable-rollback
  ```
