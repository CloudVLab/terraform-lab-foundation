# Terraform: Cloud Code Developer 

Create a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id   = "my-gcp-project"
gcp_region       = "us-central1"
gcp_zone         = "us-central1-a"
gceInstanceName  = "tester-vm"
gcp_username     = "name@domain.com"
gceMachineImage  = "cloud-code-codeserver"
gceStartup       = "echo Hello"
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| ideEditorService | The service URL for the ide |
| ideInstanceName | The name of the GCE instance |
| ideVPC | The name of VPC |
| ideSubnet | The name of the Subnet |

## Adding a Commit 

Commits to the repository will initiate the automated QA proces.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
