# Terraform: App Engine 

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
gae_hasDatabase = false 
```

__NOTE:__ Cloud Firestore Database 

The default for `gae_hasDatabase` is false, meaning do not create a database.
If the `gae_hasDatabase` flag is set to true, a database type specified in the 
`gae_db_type` will be created. 
The `gcp_db_type` value can be set where a database should be provisioned:
- [x] `gcp_db_type = "CLOUD FIRESTORE"` is the default setting
- [x] `gcp_db_type = "CLOUD_DATASTORE_COMPATIBILITY"` 

### Example Cloud Firestore

```
gae_location    = "US"
gae_hasDatabase = true 
gae_db_type     = "CLOUD_FIRESTORE" 
```


### Example Cloud Datastore 

```
gae_location    = "US"
gae_hasDatabase = true 
gae_db_type     = "CLOUD_DATASTORE_COMPATIBILITY" 
```


## Example

View the [example configuration](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/basics/app_engine/example) to get started.

## Accessing Output Values 

N/A

## Adding a Commit 

Commits to the repository will initiate the automated QA process

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
