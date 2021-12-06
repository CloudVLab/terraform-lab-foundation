# Terraform: Google Cloud Storage 

| Channel | Status |
|---------|--------|
| Stable  | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=2585d58a-918e-4bf1-b4de-e1c3a2ed949c) |
| Beta    | ![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=878a4ae2-099c-4458-a575-f0be99a621aa) |

Create a virtual machine based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
gcp_project_id       = "my-gcp-project"
gcp_region           = "us-central1"
gcp_zone             = "us-central1-a"
gcs_bucket_extension = "my_bucket"
```

__NOTE:__ Buckets are prefixed with the `project_id` to ensure they are globally unique.
Ensure the value for the `gcs_bucket_extension` is unique within the project.

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| gcs_bucket_name | The name of the GCS bucket |

## Adding a Commit 

Commits to the repository will initiate the automated QA proces.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
