# Terraform: Vertex AI Notebook 

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
vai_notebook_name = var.tfResourceName
vai_username      = var.tfUsername
vai_region        = var.gcp_region
vai_zone          = var.gcp_zone
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|

## Adding a Commit 

Commits to the repository will initiate the automated QA proces.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
