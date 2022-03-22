# Terraform: Proxy Vertex Workbench 

Create a Vertex Workbench and use Proxy to access using a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id       = "my-gcp-project"
gcp_region           = "us-central1"
gcp_zone             = "us-central1-a"
gceImageFamily       = "tf-latest-cpu"
gceImageProject      = "deeplearning-platform-release"
gceMachineType       = "e2-medium"
gcePostStartupScript = "Public URL"
gcrServiceName       = "workbench-service"
gcrRolePermission    = "roles/run.invoker"
gcrMemberPermission  = "allUsers"
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| notebook_service_url| The service URL for the notebook |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
