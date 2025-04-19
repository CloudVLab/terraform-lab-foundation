## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_vpc_access_connector.connector](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_vpc_access_connector) | resource |
| [google_project_service.vpcaccess-api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_sva_connector_machine_type"></a> [sva\_connector\_machine\_type](#input\_sva\_connector\_machine\_type) | VPC connector machine default. | `string` | `"f1-micro"` | no |
| <a name="input_sva_name"></a> [sva\_name](#input\_sva\_name) | Name of the VPC connector. | `string` | `"ideconn"` | no |
| <a name="input_sva_network"></a> [sva\_network](#input\_sva\_network) | Name of the VPC network to use. | `string` | `"default"` | no |
| <a name="input_sva_subnet_cidr"></a> [sva\_subnet\_cidr](#input\_sva\_subnet\_cidr) | VPC subnetwork to cidr. | `string` | `"10.8.0.0/28"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sva_connection_name"></a> [sva\_connection\_name](#output\_sva\_connection\_name) | Serverless VPC Access name |
