# Terraform: IAM Service Account 

| Channel | Status |
|---------|--------|
| Dev     | WIP    | 
| Stable  | TBC    | 

Create a IAM binding for a role

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
iam_sa_name        = "custom-sa" 
iam_sa_description = "Custom SA" 
```

## Example

View the [example configuration](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/basics/iam_service_account/example) to get started.

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| iam_service_account   | The name of the service created         |
| iam_service_account_description   | The description of the service created         |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
