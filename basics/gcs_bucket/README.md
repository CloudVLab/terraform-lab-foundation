# Terraform: Google Cloud Storage 

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Create a Google Cloud Storage bucket based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

Qwiklabs Properties
__NOTE:__ Qwiklabs properties are mandatory. 
The mandatory values are used to initiate the project.
```
gcp_project_id       = "my-gcp-project"
gcp_region           = "us-central1"
gcp_zone             = "us-central1-a"
```

#### Custom Properties

```
gcs_bucket_extension = "my_bucket"
gcs_append_project   = true
gcs_storage_class    = "MULTI_REGIONAL"
```

| STORAGE CLASS |
|---------------|
| STANDARD |
| MULTI_REGIONAL |
| REGIONAL | 
| NEARLINE |
| COLDLINE |
| ARCHIVE  |


__NOTE:__ Buckets are prefixed with the `project_id` to ensure they are globally unique.

If you want to override the name of the bucket:

- [x] Set the `gcs_bucket_extension` to the name of the bucket
- [x] Set the `gcs_append_project` value to false

Ensure the value for the `gcs_bucket_extension` is unique within the project.


## Accessing Output Values 

| Field | Description |
|-------|-------------|
| gcs_bucket_name | The name of the GCS bucket |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
