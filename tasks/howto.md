
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



myweb
wpuser
123eqw83@WE3q
chenchuk@gmail.com
discourage-search-engine-visibility=TRUE

