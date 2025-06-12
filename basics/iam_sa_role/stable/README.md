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
| [google_project_iam_member.tlf](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_iam_sa_name"></a> [iam\_sa\_name](#input\_iam\_sa\_name) | Role to bind to the user account | `string` | `"tester-qwiklabs"` | no |
| <a name="input_iam_sa_roles"></a> [iam\_sa\_roles](#input\_iam\_sa\_roles) | n/a | `list(string)` | <pre>[<br>  "roles/viewer"<br>]</pre> | no |

## Outputs

No outputs.
