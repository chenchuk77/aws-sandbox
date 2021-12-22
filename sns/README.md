# SNS

## SNS


publish via awscli:
```
aws sns publish \
    --topic-arn "arn:aws:sns:eu-west-1:168025714010:sam-sns-lambda-SimpleTopic-18BG1ME7L5AQS" \
    --message file://events/event-sns.json
```


Links:
https://docs.aws.amazon.com/code-samples/latest/catalog/python-sns-sns_basics.py.html


### SNS test

First setup topic and subscription
```   
$ python3 message-generator.py setup
```

Then start main loop to publish Coindesk status from api.coindesk.com
```
$ python3 message-generator.py loop
```

Or alternatively use this for test:
```
$ python3 message-generator.py test
```