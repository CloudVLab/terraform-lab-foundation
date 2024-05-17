# BigQuery Job 

Checks if a Job Id exists within a project.

### BigQuery Job

* Problem: I want validate a Job has been performed.
* Solution: Include the `get_job` method to perform this action.
* Discussion: The code linked below provides an example setup.

```ruby
  sub_query = resources['project_0']['startup_script.bq_job_query']
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] [BigqueryV2](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/BigqueryV2.html) 

