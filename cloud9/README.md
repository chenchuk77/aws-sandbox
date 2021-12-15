# cloud9

### A cloud IDE for writing, running, and debugging code

#### Links
* [AWS Cloud9](https://docs.aws.amazon.com/cloud9/latest/user-guide/welcome.html)

Start Cloud9 environment:
* NOTE: an EC2 Instance will be launched
```
aws cloud9 create-environment-ec2 \
    --name chen-env \
    --description "cloud9-chen-env" \
    --instance-type t2.micro \
    --subnet-id subnet-0a7b9569a4c972b6a \
    --tags Key=Owner,Value=Chen Key=Deployed,Value=AwsCLI \
    --automatic-stop-time-minutes 60 
```
