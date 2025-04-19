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
| [google_cloud_run_service.proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service) | resource |
| [google_cloud_run_service_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_policy) | resource |
| [google_project_service.run](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gcrEnvs"></a> [gcrEnvs](#input\_gcrEnvs) | List of custom rule definitions (refer to variables file for syntax). | <pre>list(object({<br/>    gcr_env_name  = string,<br/>    gcr_env_value = string<br/>  }))</pre> | `[]` | no |
| <a name="input_gcrImage"></a> [gcrImage](#input\_gcrImage) | GCE virtual machine image family | `string` | `"gcr.io/qwiklabs-resources/automl-proxy:latest"` | no |
| <a name="input_gcrRegion"></a> [gcrRegion](#input\_gcrRegion) | GCE virtual machine image family | `string` | `"us-central1"` | no |
| <a name="input_gcrService"></a> [gcrService](#input\_gcrService) | Name of the proxy service | `string` | `"automl-proxy"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcr_service_url"></a> [gcr\_service\_url](#output\_gcr\_service\_url) | URL of the Cloud Run service |
