# Terraform: Anthos Service Mesh

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Create a Google Kubernetes Engine (GKE) cluster with Anthos Service Mesh (ASM) installed based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process.

#### Variant

In order to consume this module, you must use a variant which allows at least 8vCPUs or more
as per Anthos Service Mesh requirements.

#### Qwiklabs Properties
```
gcp_project_id           = var.gcp_project_id 
gcp_region               = var.gcp_region 
gcp_zone                 = var.gcp_zone 
service_account_key_file = var.service_account_key_file
```

#### Custom Properties

Override in `qwiklabs.yaml` file custom_properties stanza.

```
gcp_username     = var.gcp_username 
gke_cluster_name = var.gke_cluster_name 
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| gke_cluster_name | The name of the GKE cluster |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
