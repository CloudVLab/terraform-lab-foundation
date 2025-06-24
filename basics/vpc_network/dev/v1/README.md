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
| [google_compute_network.dev_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.dev_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [time_sleep.wait_vpc_delay](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_username"></a> [gcp\_username](#input\_gcp\_username) | Name of Qwiklabs user | `string` | `"qwiklabs-student"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gcs_bucket_extension"></a> [gcs\_bucket\_extension](#input\_gcs\_bucket\_extension) | GCS Bucket name. | `string` | `"bucket"` | no |
| <a name="input_vpc_flow_logs"></a> [vpc\_flow\_logs](#input\_vpc\_flow\_logs) | VPC Flow Logs. | `bool` | `false` | no |
| <a name="input_vpc_network"></a> [vpc\_network](#input\_vpc\_network) | Name of the VPC network to create. | `string` | `"dev_network"` | no |
| <a name="input_vpc_network_description"></a> [vpc\_network\_description](#input\_vpc\_network\_description) | Custom VPC network. | `string` | `"Qwiklabs lab network"` | no |
| <a name="input_vpc_private_google_access"></a> [vpc\_private\_google\_access](#input\_vpc\_private\_google\_access) | VPC Private Google Access. | `bool` | `true` | no |
| <a name="input_vpc_region"></a> [vpc\_region](#input\_vpc\_region) | Name of the VPC subnetwork to create. | `string` | `"us-central1"` | no |
| <a name="input_vpc_subnet"></a> [vpc\_subnet](#input\_vpc\_subnet) | Name of the VPC subnetwork to create. | `string` | `"dev_subnet"` | no |
| <a name="input_vpc_subnet_cidr"></a> [vpc\_subnet\_cidr](#input\_vpc\_subnet\_cidr) | VPC subnetwork to cidr. | `string` | `"10.128.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_network_name"></a> [vpc\_network\_name](#output\_vpc\_network\_name) | Name of the VPC network |
| <a name="output_vpc_network_self_link"></a> [vpc\_network\_self\_link](#output\_vpc\_network\_self\_link) | Self Link to the VPC Network |
| <a name="output_vpc_subnet_self_link"></a> [vpc\_subnet\_self\_link](#output\_vpc\_subnet\_self\_link) | Self Link to the VPC subnet |
| <a name="output_vpc_subnetwork_name"></a> [vpc\_subnetwork\_name](#output\_vpc\_subnetwork\_name) | Name of the VPC subnet |
