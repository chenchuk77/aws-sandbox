# SNS

### Messaging service for app-to-app (A2A) and app-to-person (A2P).





publish via awscli:
```
aws sns publish \
    --topic-arn "arn:aws:sns:eu-west-1:168025714010:sam-sns-lambda-SimpleTopic-18BG1ME7L5AQS" \
    --message file://events/event-sns.json
```


Links:
* [SNS Homepage](https://aws.amazon.com/sns/?whats-new-cards.sort-by=item.additionalFields.postDateTime&whats-new-cards.sort-order=desc)
* [Boto3 SNS Docs](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/sns.html)

### SNS example app - Coindesk publisher
The example app publish update every minute to a predefined sns topic. 
The notifications will be received by 2 subscribers:
* email subscriber (xxxxxxxx@gmail.com)
* sms subscriber (+9725xxxxxxxx)


### Setup
First setup the SNS topic and the subscribers:
* NOTE: The phone number was manually added as an "Endpoint" object (using AWS console) before it can be used. 
probably there is a way to create this resource with cloudformation.

```   
aws cloudformation create-stack \
    --stack-name stack-sns \        
    --template-body file://sns.template \ 
    --parameters file://sns.json
```
Next, confirm the subscription:
* for email subscriber: confirm the subscription email in your mailbox.
* for SMS subscriber: use the AWS Console to confirm using a OTP sent over SMS.


### Run

Start publishing Coindesk status from api.coindesk.com :
```
$ python3 coindesk-updater.py
```
The app will send an update (real/fake) as soon as it starts. 
so if you plan to send only 1 message for testing, you can ^C to break and 
check your endpoints.
