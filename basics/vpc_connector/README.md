# Terraform: Serverless VPC Access 

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Create [Serverless VPC Access](https://cloud.google.com/vpc/docs/configure-serverless-vpc-access) based on a Terraform configuration
Bottom line: Use this to connect Serverless environment directly to a project VPC.

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
sva_name                   = "ideconn"
sva_network                = "default"
sva_subnet_cidr            = "10.8.0.0/28"
sva_connector_machine_type = "f1-micro" 
```

__NOTE:__ Valid VPC Connector Machine Type are:

* f1-micro
* e2-micro
* e2-standard-4

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| sva_connection_name | The name of the Serverless VPC Access created |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
