
1. Install 'WordPress basic single instance' from Cloudformation
example template:
   
   * Download template 
   ```
   curl https://s3.eu-west-1.amazonaws.com/cloudformation-templates-eu-west-1/WordPress_Single_Instance.template -o WordPress_Single_Instance.template
   ```
   * generate ssh key-pair in ec2 and save the private key locally:
   ```
   aws ec2 create-key-pair \
       --key-name key-wp-temp \
       --query "KeyMaterial" \
       --output text > key-wp-temp.pem
   ```
   * Create json file with required parameters as defined in the template:
     * Instance type
     * SSH key-pair
     * SSH Allowed access
     * DB users/passwords
   

   * Launch the template, passing the json as parameters:
   ```
   aws cloudformation create-stack \
       --stack-name stack-wp-temp \
       --template-body file://WordPress_Single_Instance.template \
       --parameters file://WordPress_Single_Instance.json
   ```

   * Verify stack status:
   ```
   aws cloudformation describe-stacks \
       --stack-name stack-wp-temp \
   
   aws cloudformation describe-stacks \
       --stack-name stack-wp-temp \
       --output json |\
       jq '.Stacks[0].StackStatus'
   ```

   * Get URL from stack output (or launch directly):
   ```
   aws cloudformation describe-stacks \
       --stack-name stack-wp-temp \
       --query "Stacks[0].Outputs[?OutputKey=='WebsiteURL'].OutputValue" \
       --output text
       
   google-chrome $(aws cloudformation describe-stacks \
                       --stack-name stack-wp-temp \
                       --query "Stacks[0].Outputs[?OutputKey=='WebsiteURL'].OutputValue" \
                       --output text)    
   ```


   * Launch vpc/rds-multi-az (necessary infra for WordPress_Multi_AZ.template )
   ```
   aws cloudformation create-stack \                                                    
      --stack-name stack-vpc-rds-temp \
      --template-body file://vpc-rds-multi-az.template \
      --parameters file://vpc-rds-multi-az.json \
      --capabilities CAPABILITY_IAM \
      --disable-rollback

   
   ```

   * Launch aws WordPress_Multi_AZ multi-az (ec2/alb/asg) on existing infra (vpc/dbsg/subnets/igw/etc)
   ```
    aws cloudformation create-stack \
          --stack-name stack-aws-wpmaz-temp \
          --template-body file://WordPress_Multi_AZ.template \
          --parameters file://WordPress_Multi_AZ.json \
          --capabilities CAPABILITY_IAM \
          --disable-rollback
    
    ```


* Launch ASG template, passing the json as parameters:
  ```
  aws cloudformation create-stack \
      --stack-name stack-asg-wp-temp \
      --template-body file://asg-wp.template \
      --parameters file://asg-wp.json \
      --capabilities CAPABILITY_IAM \
      --disable-rollback
  ```

  
  Can wait for final state signal:
  ```
  # this command is blocking until final cfn state
  aws cloudformation wait stack-create-complete \
      --stack-name stack-cw-log-temp
  
  # verify
  echo $?
  0

  ```

  Get template from cloudformation:
  ```
  aws cloudformation get-template \
      --stack-name stack-chen-test111 \
      --output json \
      > stack-chen-test111-from-cfn.template
 
  ```

ASG: source template : 
https://github.com/awsdocs/aws-cloudformation-user-guide/blob/main/doc_source/example-templates-autoscaling.md



myweb
wpuser
123eqw83@WE3q
chenchuk@gmail.com
discourage-search-engine-visibility=TRUE


aws ec2 describe-availability-zones --region eu-west-1 --output table

