# Terraform: Cloud Firestore Database 

Create a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

#### Qwiklabs Properties
```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
```

## Custom Properties
```
gcp_ae_location = "US"
hasFirestoreDb  = false
```

__NOTE:__
The `gcp_db_type` value can be set where a database should be provisioned
- [x] `gcp_db_type = "CLOUD FIRESTORE" ` is the default setting
- [x] `gcp_db_type = "CLOUD_DATASTORE_COMPATIBILITY"` 



## Example

View the [example configuration](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/basics/cloud_firestore/example) to get started.

## Accessing Output Values 

N/A

## Adding a Commit 

Commits to the repository will initiate the automated QA process

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
