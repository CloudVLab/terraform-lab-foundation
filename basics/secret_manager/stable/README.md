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
| [google_secret_manager_secret.lab-secret](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_iam_member.endpoint-secret-access](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_iam_member) | resource |
| [google_secret_manager_secret_version.lab-data](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_secret_manager_data"></a> [secret\_manager\_data](#input\_secret\_manager\_data) | Label to be applied to the Secret. | `string` | `"lab-data"` | no |
| <a name="input_secret_manager_identifier"></a> [secret\_manager\_identifier](#input\_secret\_manager\_identifier) | Unique secret payload identifier. | `string` | `"lab-secret"` | no |
| <a name="input_secret_manager_label"></a> [secret\_manager\_label](#input\_secret\_manager\_label) | Label to be applied to the Secret. | `string` | `"lab"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_id"></a> [secret\_id](#output\_secret\_id) | n/a |
