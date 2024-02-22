# Firewall 

Checks if a Firewall Rule exists within a project.

## Firewall Rule 

* Problem: I want validate a Firewall Rule has been created.
* Solution: Include the `get_firewall` method to perform this action.
* Discussion: The code linked below provides an example setup.

```
  compute  = handles['project_0.ComputeV1']
  fw_rule_name = resources['project_0']['startup_script.fw_rule_name']
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] ComputeV1 

