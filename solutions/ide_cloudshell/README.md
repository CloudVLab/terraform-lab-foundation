# Terraform: IDE 

Create an Integrated Development Environment based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id  = "my-gcp-project"
gcp_region      = "us-central1"
gcp_zone        = "us-central1-a"
gceMachineImage = "[IMAGE]-codeserver"
```

Custom images are available.

| Image | Description |
|-------|-------------|
| cloudshell-codeserver | Alternative cloudshell image |
| cloud-code-codeserver | Cloud Code Plugin |

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| ide_service_url | The service URL for the ide |
| ide_browser_url | The service URL for the browser |
| ide_instance_name | The name of the GCE instance |

## Adding a Commit 

Commits to the repository will initiate the automated QA proces.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
