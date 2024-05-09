# Cloud Storage

Checks if a Bucket Object exists within a project.

## Cloud Storage Bucket 

* Problem: I want validate a bucket object has been created.
* Solution: Include the `get_bucket` method to perform this action.
* Discussion: The code linked below provides an example setup.

```ruby
  storage       = handles['project_0.StorageV1']
  bucket_name   = resources['project_0']['startup_script.bucket_name']
  bucket_object = resources['project_0']['startup_script.bucket_object']
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] [StorageV1](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/StorageV1.html)
