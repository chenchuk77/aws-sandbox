# EventBridge
####EventBridge is a serverless event bus. EventBridge delivers a stream of real-time data from event sources such as Zendesk or Shopify to targets like AWS Lambda and other SaaS applications.
####EventBridge simplifies the process of building event-driven architectures

Event-driven architectures have three key components: event producers, event routers, and event consumers. A producer publishes an event to the router, which filters and pushes the events to consumers. Producer services and consumer services are decoupled, which allows them to be scaled, updated, and deployed independently.

### EventBridge vs SNS
Those are the main differences from the video in the links (2019)

* SNS is faster (25ms vs 560ms)
* SNS support millions subs per topic (EventBridge - 5 per rule but can be more)
* EventBridge allow filter by body, SNS only by message attributes.

#### Links
* [EventBridge Deep Dive](https://pages.awscloud.com/Deep-Dive-on-Amazon-EventBridge_2019_0919-SRV_OD.html)
