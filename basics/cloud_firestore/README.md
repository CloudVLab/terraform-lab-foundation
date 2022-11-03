# Terraform: App Engine + Cloud Firestore Database 

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
gae_location    = "US"
gae_hasDatabase = true
gae_db_type     = "CLOUD_FIRESTORE" 
```

__NOTE:__
The gae_hasDatabase field is used to determine if a database should be added to AppEngine.
The `gcp_db_type` value can be set where a database should be provisioned:
- [x] `gcp_db_type = "CLOUD FIRESTORE"` is the default setting
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
