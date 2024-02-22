# Source Repository Create

Checks if a Source Repository exists within a project.

### Source Repository

* Problem: I want validate a Source Repository has been created.
* Solution: Include the `get_repo` method to perform this action.
* Discussion: The code linked below provides an example setup.

```
  sourcerepo = handles['project_0.SourcerepoV1']
  repo_name  = 'projects/' + resources['project_0']['project_id'] + '/repos/' + resources['project_0']['startup_script.source_repo_name'
```

In the above code, the resources definition accesses a startup script value.

## Googleapi 

-[ ] SourcerepoV1 

