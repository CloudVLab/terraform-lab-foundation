# BigQuery Job 

Checks if a Job Id matching a query exists within a project.

### BigQuery Job

* Problem: I want validate a Job has been performed.
* Solution: Include the `get_job` method to perform this action.
* Discussion: The code linked below provides an example setup. Us the `bq_job_query` property to reference a unique job filter.

```ruby
  sub_query = resources['project_0']['startup_script.bq_job_query']
```

In the above code, the resources definition accesses a startup script value.
The `bq_job_query` represents the SQL used as part of the job.

__Note:__
If a unique reference is required, it is important to provide a unique value
the `sub_query`. In most instances, this can be achieved, by including additional 
query information such as the dataset and/or table.


## Googleapi 

-[ ] [BigqueryV2](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/BigqueryV2.html) 

