# PubSub Subscription Create

Checks if a PubSub subscription exists within a project.

## PubSub Subscription 

* Problem: I want validate a PubSub Subscription has been created.
* Solution: Include the `get_subscription` method to perform this action.
* Discussion: The code linked below provides an example setup.

```
  pubsub   = handles['project_0.PubsubV1']
  sub_name = 'projects/' + pubsub.project + '/subscriptions/' + resources['project_0']['startup_script.pubsub_sub_name']
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] [PubsubV1](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/PubsubV1.html) 
