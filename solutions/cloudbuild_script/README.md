# Terraform: Cloud Build Script 

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Invoke Cloud Build based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process.

#### Qwiklabs Properties
```
gcp_project_id           = var.gcp_project_id 
gcp_region               = var.gcp_region 
gcp_zone                 = var.gcp_zone 
service_account_key_file = var.service_account_key_file
```

#### Custom Properties

Override in `qwiklabs.yaml` file custom_properties stanza.


## Accessing Output Values 

N/A

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
