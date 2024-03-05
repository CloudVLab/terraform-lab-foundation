# VPC Subnet Create

Checks if a VPC Subnet exists within a project.

## Virtual Private Cloud Subnet 

* Problem: I want validate a subnet has been created.
* Solution: Include the `get_subnetwork` method to perform this action.
* Discussion: The code linked below provides an example setup.

```
  compute  = handles['project_0.ComputeV1']
  subnetwork_name = resources['project_0']['startup_script.vpc_subnetwork_name']
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] [ComputeV1](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/ComputeV1.html) 
