# Terraform: Virtual Private Cloud 

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Create a virtual machine based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

#### Qwiklabs Properties
```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
```

#### Custom Properties

```
vpc_network   = "dev-network"
vpc_network_description = "My network"
vpc_subnet    = "dev-subnet"
vpc_region    = "us-central1"
vpc_subnet_cidr = "10.128.0.0/16"
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| vpc_network_name | The name of the VPC network |
| vpc_network_name | The name of the VPC subnet  |

## Adding a Commit 

Commits to the repository will initiate the automated QA proces.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
