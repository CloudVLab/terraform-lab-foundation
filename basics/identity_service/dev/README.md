## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_project_service_identity.tlf](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_project_service_identity) | resource |
| [time_sleep.wait_identity_delay](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_identity_create_duration"></a> [identity\_create\_duration](#input\_identity\_create\_duration) | Duration delay to apply post API enablement | `string` | `"60s"` | no |
| <a name="input_identity_services"></a> [identity\_services](#input\_identity\_services) | n/a | `list(string)` | <pre>[<br>  "compute.googleapis.com"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wait_identity_delay"></a> [wait\_identity\_delay](#output\_wait\_identity\_delay) | # -------------------------------------------------------------- # Custom variable defintions # -------------------------------------------------------------- |
