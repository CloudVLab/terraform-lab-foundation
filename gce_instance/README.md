# Terraform: Google Compute Engine

Create a virtual machine based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
vm_name        = "tester-vm"
username       = "name@domain.com"
```

## Accessing Output Values 

The external IP assigned to the GCE instance
```
gce_external_ip
```

The name of the GCE instance
```
gce_instance_name
```

## Adding a Commit 

Commits to the repository will initiate the automated QA proces.
It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
