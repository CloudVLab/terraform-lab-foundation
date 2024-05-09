# Log Sink

Checks if a Log Sink exists within a project.

## Logging Sink 

* Problem: I want validate a sink has been created.
* Solution: Include the `get_sink` method to perform this action.
* Discussion: The code linked below provides an example setup.

```ruby
  log_sink  = handles['project_0.LoggingV2']
  log_sink_name = 'projects/' + log_sink.project + '/sinks/' + resources['project_0']['startup_script.log_sink_name']
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] [LoggingV2](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/LoggingV2.html) 
