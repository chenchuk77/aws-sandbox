# Serverless

## AWS SAM
AWS SAM is a simplification of the CloudFormation template, which allows you to easily define AWS resources that are common in serverless applications.


#### Links
* [SAM - Cloudformation](https://aws.amazon.com/blogs/compute/introducing-simplified-serverless-application-deplyoment-and-management/)
* [SAM - Intro video](https://www.youtube.com/watch?v=1dzihtC5LJ0)
* [SAM/SAM-CLI - Deep Dive into AWS SAM](https://www.youtube.com/watch?v=CIdUU6rNdk4)
* [Mastering the AWS Serverless Application Model (AWS SAM) - AWS Online Tech Talks](https://www.youtube.com/watch?v=QBBewrKR1qg)


1. init a new project named hello  


### Using SAM CLI to create a new project structure

Create a new project named sam-hello:
``` 
$ sam init
```
Build the project:
```
$ cd sam-app  
sam-app $ sam build 
```
* Note: 2 templates will be created:
  * ./template.yaml (main)
  * ./.aws-sam/build/template.yaml (only for local-deployment)

Deploy to AWS (creates NON-FREE aws resources):
```
~/sam-app $ sam deploy --guided
```

Deploy to Docker (optional):
```
~/sam-app $ sam local start-api
```

### Testing the app
List items:
```
$ curl -X POST -d '{"id":"101", "name":"dog"}' https://eumn0b0kgc.execute-api.eu-west-1.amazonaws.com/Prod/
```
Add item
```
$ curl -X GET -s \
        https://eumn0b0kgc.execute-api.eu-west-1.amazonaws.com/Prod/ | jq .
```

Cleanning up (deleting the Cloudformation stack and the referenced AWS resources): 
```
~/sam-app $ sam delete
```

### More cli commands:
```
 # manual package/upload to s3 (use for CI/CD pipelines):
 sam package
 
 # test lambda 
 sam local invoke HelloFunc -e events/event.json
  
 # logs
 sam logs --stack-name xxx --name HelloFunc 
  
 # test local docker deployment
 curl http://127.0.0.1:3000/hello
```

### Install nodejs12/nodejs14 ubuntu:
```
sudo snap install node --classic --channel=14
sudo snap refresh node --channel=12
which node
/snap/bin/node --version
```
