# Terraform: Vertex AI Workbench 

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Create a Vertex AI workbench based on a Terraform configuration

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
vai_workbench_name      = var.tfResourceName
vai_post_startup_script = "gs://[BUCKET]/[LAB_ID]lab-init.sh"
```

#### Post Startup Script

Please ensure the startup script follows the Vertex AI Startup information in [CCC](https://docs.google.com/document/d/13TRRcCcN3_mT8mF5eHJv-OQkmFduqZcFDUbSrBMSQFY/edit#heading=h.9fdmj1dda21y)

* lab-init.sh  - clones training-data-analyst repository
* workbench lab-init.sh - Reset ACL and clone training-data-analyst repository

## Example

View the [example configuration](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/basics/vai_workbench/example) to get started.

## Accessing Output Values 

| Field | Description |
|-------|-------------|

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
