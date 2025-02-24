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
| [google_cloud_run_service_iam_binding.public](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_binding) | resource |
| [google_cloud_run_v2_service.proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gcrInstanceTags"></a> [gcrInstanceTags](#input\_gcrInstanceTags) | List of network tags | `list(any)` | <pre>[<br>  "lab-vm"<br>]</pre> | no |
| <a name="input_gcrMemberAccess"></a> [gcrMemberAccess](#input\_gcrMemberAccess) | Member access to the service | `list` | <pre>[<br>  "allUsers"<br>]</pre> | no |
| <a name="input_gcrNetworkName"></a> [gcrNetworkName](#input\_gcrNetworkName) | Custom network | `string` | `"default"` | no |
| <a name="input_gcrServiceEgress"></a> [gcrServiceEgress](#input\_gcrServiceEgress) | Egress applied to the Cloud Run service | `string` | `"ALL_TRAFFIC"` | no |
| <a name="input_gcrServiceImage"></a> [gcrServiceImage](#input\_gcrServiceImage) | Name of the Cloud Run service | `string` | `"gcr.io/qwiklabs-resources/test-ide-proxy:latest"` | no |
| <a name="input_gcrServiceName"></a> [gcrServiceName](#input\_gcrServiceName) | Name of the Cloud Run service | `string` | `"lab-service"` | no |
| <a name="input_gcrServiceRole"></a> [gcrServiceRole](#input\_gcrServiceRole) | Role permission for service access | `string` | `"roles/run.invoker"` | no |
| <a name="input_gcrSubnetName"></a> [gcrSubnetName](#input\_gcrSubnetName) | Custom network | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | URL of the Cloud Run service |
