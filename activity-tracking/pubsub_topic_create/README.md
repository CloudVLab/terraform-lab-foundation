# PubSub Topic Create

Checks if a PubSub topic exists within a project.

### PubSub Topic

* Problem: I want validate a PubSub Topic has been created.
* Solution: Include the `get_topic` method to perform this action.
* Discussion: The code linked below provides an example setup.

```ruby
  pubsub     = handles['project_0.PubsubV1']
  topic_name = 'projects/' + pubsub.project + '/topics/' + resources['project_0']['startup_script.pubsub_topic_name']
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] [PubsubV1](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/PubsubV1.html) 

