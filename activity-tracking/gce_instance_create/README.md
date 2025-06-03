# Google Compute Engine 

Checks if a GCE instance exists within a project.

## Google Compute Engine Instance

* Problem: I want validate a GCE instance has been created.
* Solution: Include the `get_instance` method to perform this action.
* Discussion: The code linked below provides an example setup.

```ruby
  compute       = handles['project_0.ComputeV1']
  instance_name = resources['project_0']['startup_script.instance_name']
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] [StorageV1](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/ComputeV1.html)
