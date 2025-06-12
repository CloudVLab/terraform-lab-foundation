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
| [google_project_iam_member.sa_iam_bind](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_iam_role"></a> [iam\_role](#input\_iam\_role) | Role to bind to the user account | `string` | `"roles/viewer"` | no |
| <a name="input_iam_sa"></a> [iam\_sa](#input\_iam\_sa) | Display name for the SA | `string` | `"tester-qwiklabs account"` | no |
| <a name="input_iam_sa_description"></a> [iam\_sa\_description](#input\_iam\_sa\_description) | Custom Service Account for IAM binding | `string` | `"Custom service account"` | no |
| <a name="input_iam_sa_display"></a> [iam\_sa\_display](#input\_iam\_sa\_display) | Display name for the SA | `string` | `"tester-qwiklabs account"` | no |
| <a name="input_iam_sa_name"></a> [iam\_sa\_name](#input\_iam\_sa\_name) | Role to bind to the user account | `string` | `"tester-qwiklabs"` | no |
| <a name="input_iam_user"></a> [iam\_user](#input\_iam\_user) | Name of Qwiklabs user | `string` | `"tester@gmail.com"` | no |

## Outputs

No outputs.
