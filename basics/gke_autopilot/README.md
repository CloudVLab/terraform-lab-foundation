# Terraform: Google Kubernetes Engine: Autopilot

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 

Create a Terraform configuration
To use this module ensure the following are added to your project:

* GKE Autopilot 

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
gkeLocation      = gke_region
gkeClusterName   = "tester-gke"
gkeDescription   = "Lab cluster"
gkeNetwork       = "default"
gkeSubnetwork    = "default"
```


## Accessing Output Values 

| Field | Description |
|-------|-------------|
| gkeClusterName | The name of the GKE cluster |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
