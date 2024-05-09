# VPC Network Create

Checks if a VPC Network exists within a project.

## Virtual Private Cloud (VPC) 

* Problem: I want validate a VPC has been created.
* Solution: Include the `get_network` method to perform this action.
* Discussion: The code linked below provides an example setup.

```ruby
  compute  = handles['project_0.ComputeV1']
  vpc_name = resources['project_0']['startup_script.vpc_network_name']
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] [ComputeV1](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/ComputeV1.html) 

