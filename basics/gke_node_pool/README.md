# Terraform: Google Kubernetes Engine Node Pool

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 

Create a Terraform configuration

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
gkeLocation      = gke_zone | gke_region
gkeClusterName   = "tester-gke"
gkeDescription   = "Lab cluster"
gkeNetwork       = "default"
gkeSubnetwork    = "default"
```
__NOTE:__
* gkeClusterName needs to match the name of GKE Cluster

## Accessing Output Values 

| Field | Description |
|-------|-------------|

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
