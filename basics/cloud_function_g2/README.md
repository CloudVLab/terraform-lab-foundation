# Terraform: Cloud Function (GEN 2)

Create a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

#### Qwiklabs Properties
```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
```

## Custom Properties
```
gcs_bucket_extension = "bucket"
gcs_archive_object   = "function.zip"
gcs_archive_source   = "./cf/function.zip"
gcf_name             = "test_function"
gcf_description      = "Test Cloud Function"
gcf_runtime          = "nodejs16"
gcf_entry_point      = "helloCF"
gcf_role_bind        = "roles/cloudfunctions.invoker"
gcf_member_account   = "allUsers"
```

## Example

View the [example configuration](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/basics/cloud_function/example) to get started.

## Accessing Output Values 

N/A

## Adding a Commit 

Commits to the repository will initiate the automated QA process

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
