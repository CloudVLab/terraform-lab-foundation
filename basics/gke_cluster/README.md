# Terraform: Google Kubernetes Engine

Create a GKE cluster based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
cluster_name   = "tester-gke"
gcp_username       = "name@domain.com"
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| gke_instance_name | The name of the GKE cluster |

## Adding a Commit 

Commits to the repository will initiate the automated QA proces.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
