# FIS
#### AWS Fault Injection Simulator (AWS FIS) is a managed service that enables you to perform fault injection experiments on your AWS workloads.


Creating IAM Role and policy to allow FIS to access aws resources:
```
aws cloudformation create-stack \
      --stack-name stack-iam-fis-role-temp \
      --template-body file://iam-fis-role.yml \
      --capabilities CAPABILITY_IAM \
      --capabilities CAPABILITY_NAMED_IAM 
```








#### TODO:
* add parameters json file
* check examples:
  * https://github.com/1Strategy/iam-starter-templates/blob/master/iam-roles-and-policies/role-and-policy.yaml


