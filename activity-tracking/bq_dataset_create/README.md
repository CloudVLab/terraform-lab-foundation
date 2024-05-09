# BigQuery Dataset Create

Checks if a dataset exists within a project.

## BigQuery Dataset

* Problem: I want validate a dataset has been created.
* Solution: Include the `get_dataset` method to perform this action.
* Discussion: The code linked below provides an example setup.

```ruby
  bigquery     = handles['project_0.BigqueryV2']
  dataset_name = resources['project_0']['startup_script.bq_dataset_name']
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] [BigqueryV2](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/BigqueryV2.html) 
