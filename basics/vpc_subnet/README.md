# Terraform: Virtual Private Cloud Subnet

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 
| Dev     | TBC    | 

Create a virtual private cloud subnetwork based on a Terraform configuration

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
vpc_network             = "dev-network"
vpc_subnet              = "dev-subnet"
vpc_region              = "us-central1"
vpc_subnet_cidr         = "10.1.0.0/24"
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| vpc_subnetwork_name | The name of the VPC subnet  |
| vpc_subnet_self_link | Self Link to the VPC subnet  |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
