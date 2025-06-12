## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_la_api_secret_manager"></a> [la\_api\_secret\_manager](#module\_la\_api\_secret\_manager) | github.com/CloudVLab/terraform-lab-foundation//basics/api_service/stable | n/a |
| <a name="module_la_automl"></a> [la\_automl](#module\_la\_automl) | github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cr_env"></a> [cr\_env](#input\_cr\_env) | List of custom rule definitions (refer to variables file for syntax). | <pre>list(object({<br>    gcr_env_name  = string,<br>    gcr_env_value = string<br>  }))</pre> | `[]` | no |
| <a name="input_cr_image"></a> [cr\_image](#input\_cr\_image) | Image for the proxy service | `string` | `"gcr.io/qwiklabs-resources/automl-proxy:latest"` | no |
| <a name="input_cr_region"></a> [cr\_region](#input\_cr\_region) | Region for the Cloud Run service | `string` | `"us-central1"` | no |
| <a name="input_cr_service_name"></a> [cr\_service\_name](#input\_cr\_service\_name) | Name of the proxy service to be created | `string` | `"automl-proxy"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | Terraform Output values |
