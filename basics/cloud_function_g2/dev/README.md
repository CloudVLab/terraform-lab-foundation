## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_service_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_policy) | resource |
| [google_cloudfunctions2_function.custom_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function) | resource |
| [google_storage_bucket.bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.archive](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [google_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcf_archive_object"></a> [gcf\_archive\_object](#input\_gcf\_archive\_object) | Name of the Cloud Function. | `string` | `"function.zip"` | no |
| <a name="input_gcf_archive_source"></a> [gcf\_archive\_source](#input\_gcf\_archive\_source) | Name of the Cloud Function. | `string` | `"./cf/function.zip"` | no |
| <a name="input_gcf_description"></a> [gcf\_description](#input\_gcf\_description) | Description of the Cloud Function. | `string` | `"Test function description"` | no |
| <a name="input_gcf_entry_point"></a> [gcf\_entry\_point](#input\_gcf\_entry\_point) | Runtime of the Cloud Function. | `string` | `"helloCF"` | no |
| <a name="input_gcf_environment_variables"></a> [gcf\_environment\_variables](#input\_gcf\_environment\_variables) | n/a | `map(string)` | <pre>{<br>  "PROJECT_ID": "undefined"<br>}</pre> | no |
| <a name="input_gcf_member_account"></a> [gcf\_member\_account](#input\_gcf\_member\_account) | IAM member account. | `string` | `"allUsers"` | no |
| <a name="input_gcf_name"></a> [gcf\_name](#input\_gcf\_name) | Name of the Cloud Function. | `string` | `"test_function"` | no |
| <a name="input_gcf_role_bind"></a> [gcf\_role\_bind](#input\_gcf\_role\_bind) | IAM role binding. | `string` | `"roles/cloudfunctions.invoker"` | no |
| <a name="input_gcf_runtime"></a> [gcf\_runtime](#input\_gcf\_runtime) | Runtime of the Cloud Function. | `string` | `"nodejs16"` | no |
| <a name="input_gcf_target_bucket"></a> [gcf\_target\_bucket](#input\_gcf\_target\_bucket) | Target bucket to upload source code. | `string` | `"mybucket"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gcs_bucket_extension"></a> [gcs\_bucket\_extension](#input\_gcs\_bucket\_extension) | Name of the Cloud Function. | `string` | `"bucket"` | no |

## Outputs

No outputs.
