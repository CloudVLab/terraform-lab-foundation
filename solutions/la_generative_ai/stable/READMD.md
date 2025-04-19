## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_notebooks_instance.genai_notebook](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/notebooks_instance) | resource |
| [google_project_iam_member.servacct-compute-add-permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.gcp_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_storage_bucket.generative_ai_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.lab_config_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.notebook_config_script](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [local_file.notebook_config](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_string.rand](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compute_service_account_project_iam_list"></a> [compute\_service\_account\_project\_iam\_list](#input\_compute\_service\_account\_project\_iam\_list) | Roles needed for compute SA | `list(string)` | <pre>[<br/>  "roles/aiplatform.admin",<br/>  "roles/artifactregistry.admin",<br/>  "roles/bigquery.admin",<br/>  "roles/cloudbuild.builds.editor",<br/>  "roles/cloudbuild.integrations.editor",<br/>  "roles/iam.serviceAccountAdmin",<br/>  "roles/notebooks.admin",<br/>  "roles/resourcemanager.projectIamAdmin",<br/>  "roles/storage.admin"<br/>]</pre> | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_service_list"></a> [gcp\_service\_list](#input\_gcp\_service\_list) | The list of apis necessary for the project | `list(string)` | <pre>[<br/>  "aiplatform.googleapis.com",<br/>  "artifactregistry.googleapis.com",<br/>  "bigquery.googleapis.com",<br/>  "cloudbuild.googleapis.com",<br/>  "cloudresourcemanager.googleapis.com",<br/>  "compute.googleapis.com",<br/>  "containerregistry.googleapis.com",<br/>  "iam.googleapis.com",<br/>  "notebooks.googleapis.com"<br/>]</pre> | no |
| <a name="input_gcp_user_id"></a> [gcp\_user\_id](#input\_gcp\_user\_id) | User Id | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_sme_git_repo"></a> [sme\_git\_repo](#input\_sme\_git\_repo) | Generative AI Repository | `string` | `"https://github.com/GoogleCloudPlatform/generative-ai.git"` | no |
| <a name="input_sme_image_family"></a> [sme\_image\_family](#input\_sme\_image\_family) | Machine image family | `string` | `"tf-ent-2-11-cu113-notebooks-debian-11-py310"` | no |
| <a name="input_sme_image_project"></a> [sme\_image\_project](#input\_sme\_image\_project) | Machine image project | `string` | `"deeplearning-platform-release"` | no |
| <a name="input_sme_machine_type"></a> [sme\_machine\_type](#input\_sme\_machine\_type) | Notebook machine type | `string` | `"e2-standard-2"` | no |
| <a name="input_sme_notebook_name"></a> [sme\_notebook\_name](#input\_sme\_notebook\_name) | Notebook name | `string` | `"generative-ai-jupyterlab"` | no |

## Outputs

No outputs.
