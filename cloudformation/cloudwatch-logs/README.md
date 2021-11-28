
## cloudwatch-logs

* Example of streaming apache logs into cloudwatch

  ```
  aws cloudformation create-stack \
      --stack-name stack-cw-log-temp \
      --template-body file://aws-cw-log.template \
      --parameters file://aws-cw-log.json \
      --capabilities CAPABILITY_IAM \
      --disable-rollback
  ```
