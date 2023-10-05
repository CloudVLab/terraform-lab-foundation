# Terraform: Firebase Project 

| Channel | Status |
|---------|--------|
| Stable  | ![CloudBuild]() |
| Beta    | ![CloudBuild]() |

Create a Firebase Project based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

#### Qwiklabs Properties
```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
```

#### Custom Properties
N/A

## Example

View the [example configuration](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/basics/firebase_project/example) to get started.

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| firebase_project_id | Firebase project identifier |
| firebase_project_number | Firebase project number |

## Adding a Commit 

Commits to the repository will initiate the automated QA process

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
