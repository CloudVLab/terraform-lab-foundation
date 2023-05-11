# Terraform: Generative AI

Terraform configuration to create:

- [x] Enable Googleapis 
- [x] Random generator 
- [x] Service Account
- [x] Google Cloud Storage 
- [x] IAM Google Cloud Storage 
- [x] Local file configuration 
- [x] Vertex AI Notebook instance 


## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id  = "my-gcp-project"
gcp_region      = "us-central1"
gcp_zone        = "us-central1-a"
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| N/A   | N/A         |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
