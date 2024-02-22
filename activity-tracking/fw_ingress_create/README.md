# Firewall 

Checks if a Firewall Ingress Rule exists within a project.

## Firewall Ingress 

* Problem: I want validate an Ingress Firewall Rule has been created.
* Solution: Include the `get_firewall` method to perform this action.
* Discussion: The code linked below provides an example setup.

```
  compute  = handles['project_0.ComputeV1']
  fw_rule_name = resources['project_0']['startup_script.fw_rule_name']
  fw_rule_direction = resources['project_0']['startup_script.fw_rule1_direction'].downcase
```

In the above code, the resources definition accesses a startup script value.
A string downcase method is used fw_rule_direction to give a lowercase result. 

On the resulting value, a comparative is then perform on the `get_firewall` response. 

## Googleapi 

-[ ] ComputeV1 

