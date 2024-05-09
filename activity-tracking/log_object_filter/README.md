# Log Object Filter 

Checks if a Log Filter exists within a project.

## Logging Sink 

* Problem: I want validate a Log entry has been created.
* Solution: Include the `logging.list_entry_log_entries` method to perform this action.
* Discussion: The code linked below provides an example setup.

```
  # Filters for creation of the Artifact Repository
  log_filters = [
    'timestamp>"' + lab_start_time.utc.iso8601 + '"',
    'protoPayload.methodName:"ArtifactRegistry.CreateRepository"',
    'protoPayload.serviceName="artifactregistry.googleapis.com"',
    'protoPayload.request.repositoryId="' + ar_repo_name + '"'
  ]

  # Build log filter
  custom_filter = log_filters.join(" AND ")

  # Set the filter
  list_log_entries_request_object.filter = custom_filter
  log_explorer_logs = logging.list_entry_log_entries(list_log_entries_request_object)&.entries || []

  # Verify number of matching logs
  if log_explorer_logs.count > 0
    ...
  else
    ...
  end
```

The log filter is a direct copy of the Log Explorer filter applied in Google Cloud.
Applying the filter to a List, makes creating this type of activity tracking a quick option.

Use the `join` command to encode the filter string with the necessary `AND` statement.

__NOTE:__ 

* Logs are typically not available in real time, so anticipate a delay before they are available to be referenced via activity tracking.

## Googleapi 

-[ ] [LoggingV2](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/LoggingV2.html) 
