## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_la_fw"></a> [la\_fw](#module\_la\_fw) | github.com/CloudVLab/terraform-lab-foundation//basics/vpc_firewall/stable | n/a |
| <a name="module_la_gce"></a> [la\_gce](#module\_la\_gce) | github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable | n/a |
| <a name="module_la_ide_proxy"></a> [la\_ide\_proxy](#module\_la\_ide\_proxy) | github.com/CloudVLab/terraform-lab-foundation//solutions/lab_proxy/dev | n/a |
| <a name="module_la_vpc"></a> [la\_vpc](#module\_la\_vpc) | github.com/CloudVLab/terraform-lab-foundation//basics/vpc_network/stable | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_image.image_family](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gceStartup"></a> [gceStartup](#input\_gceStartup) | Zone to create resources in. | `string` | `"echo Welcome Cloud Code Developer > /tmp/octopus.txt"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ideEditorService"></a> [ideEditorService](#output\_ideEditorService) | URL of the IDE service |
| <a name="output_ideInstanceName"></a> [ideInstanceName](#output\_ideInstanceName) | Name of the GCE instance |
| <a name="output_ideSubnet"></a> [ideSubnet](#output\_ideSubnet) | Name of the Subnet |
| <a name="output_ideVPC"></a> [ideVPC](#output\_ideVPC) | Name of the VPC |
