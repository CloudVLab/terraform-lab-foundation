## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_service.tlf](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [time_sleep.wait_api_delay](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_create_duration"></a> [api\_create\_duration](#input\_api\_create\_duration) | Duration delay to apply post API enablement | `string` | `"60s"` | no |
| <a name="input_api_service_deny"></a> [api\_service\_deny](#input\_api\_service\_deny) | Disable dependent services | `bool` | `false` | no |
| <a name="input_api_services"></a> [api\_services](#input\_api\_services) | n/a | `list(string)` | <pre>[<br>  "storage-api.googleapis.com"<br>]</pre> | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wait_api_delay"></a> [wait\_api\_delay](#output\_wait\_api\_delay) | # -------------------------------------------------------------- # Custom variable defintions # -------------------------------------------------------------- |
