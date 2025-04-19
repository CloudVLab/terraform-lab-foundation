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
| [google_service_account.custom_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_iam_sa_description"></a> [iam\_sa\_description](#input\_iam\_sa\_description) | Custom Service Account for IAM binding | `string` | `"Test service account"` | no |
| <a name="input_iam_sa_display"></a> [iam\_sa\_display](#input\_iam\_sa\_display) | Custom Service Account for IAM binding | `string` | `"test"` | no |
| <a name="input_iam_sa_name"></a> [iam\_sa\_name](#input\_iam\_sa\_name) | Role to bind to the user account | `string` | `"tester-qwiklabs"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_service_account"></a> [iam\_service\_account](#output\_iam\_service\_account) | Name of the Service Account to be created |
