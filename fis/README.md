# FIS
#### AWS Fault Injection Simulator (AWS FIS) is a managed service that enables you to perform fault injection experiments on your AWS workloads.

Create IAM Role and policy to allow FIS to access aws resources:
```
aws cloudformation create-stack \
    --stack-name stack-iam-fis-role-temp \
    --template-body file://iam-fis-role.yml \
    --capabilities CAPABILITY_IAM \
    --capabilities CAPABILITY_NAMED_IAM 
```


### Create Experiment-Template (AWS FIS console)

1. Create action for cpu-stress.
2. Create targets by tag Name=aws-wpmaz-temp.
3. Optional: export to fis-inject-cpu-to-wordpress.json
 
### Run experiment from template
From AWS FIS Console start the experiment

#### Links
* [FIS - Introduction on YouTube](https://www.youtube.com/watch?v=D2px_s_FNi8&t=1234s)
* [FIS - Configuring permissions](https://chaos-engineering.workshop.aws/en/030_basic_content/030_basic_experiment/10-permissions.html)


