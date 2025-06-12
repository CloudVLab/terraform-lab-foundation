## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_la_vai_workbench"></a> [la\_vai\_workbench](#module\_la\_vai\_workbench) | gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/vai_workbench/stable/v1 | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.servacct-cloud-build-add-permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.servacct-compute-add-permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.gcp_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_pubsub_subscription.ff-tx-for-feat-eng-subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_subscription.ff-tx-subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_subscription.ff-txlabels-subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_storage_bucket.fraudfinder_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.lab_config_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.notebook_config_script](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [local_file.notebook_config](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_string.rand](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_build_service_account_project_iam_list"></a> [cloud\_build\_service\_account\_project\_iam\_list](#input\_cloud\_build\_service\_account\_project\_iam\_list) | Roles needed for compute SA | `list(string)` | <pre>[<br>  "roles/run.admin",<br>  "roles/cloudbuild.serviceAgent",<br>  "roles/aiplatform.admin",<br>  "roles/cloudbuild.builds.editor",<br>  "roles/cloudbuild.integrations.editor",<br>  "roles/iam.serviceAccountAdmin"<br>]</pre> | no |
| <a name="input_compute_service_account_project_iam_list"></a> [compute\_service\_account\_project\_iam\_list](#input\_compute\_service\_account\_project\_iam\_list) | Roles needed for compute SA | `list(string)` | <pre>[<br>  "roles/storage.admin",<br>  "roles/run.admin",<br>  "roles/bigquery.admin",<br>  "roles/aiplatform.admin",<br>  "roles/resourcemanager.projectIamAdmin",<br>  "roles/cloudbuild.builds.editor",<br>  "roles/cloudbuild.integrations.editor",<br>  "roles/artifactregistry.admin",<br>  "roles/cloudfunctions.admin",<br>  "roles/dataflow.admin",<br>  "roles/notebooks.admin",<br>  "roles/pubsub.admin",<br>  "roles/iam.serviceAccountAdmin"<br>]</pre> | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_service_list"></a> [gcp\_service\_list](#input\_gcp\_service\_list) | The list of apis necessary for the project | `list(string)` | <pre>[<br>  "compute.googleapis.com",<br>  "containerregistry.googleapis.com",<br>  "aiplatform.googleapis.com",<br>  "notebooks.googleapis.com",<br>  "cloudresourcemanager.googleapis.com",<br>  "pubsub.googleapis.com",<br>  "cloudbuild.googleapis.com",<br>  "dataflow.googleapis.com",<br>  "bigquery.googleapis.com",<br>  "run.googleapis.com",<br>  "artifactregistry.googleapis.com",<br>  "iam.googleapis.com"<br>]</pre> | no |
| <a name="input_gcp_user_id"></a> [gcp\_user\_id](#input\_gcp\_user\_id) | User Id | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

No outputs.
