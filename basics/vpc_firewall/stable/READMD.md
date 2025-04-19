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
| [google_compute_firewall.rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fwr_direction"></a> [fwr\_direction](#input\_fwr\_direction) | Direction of traffic. | `string` | `"INGRESS"` | no |
| <a name="input_fwr_name"></a> [fwr\_name](#input\_fwr\_name) | Name of rule. | `string` | `"allow-ssh-network"` | no |
| <a name="input_fwr_network"></a> [fwr\_network](#input\_fwr\_network) | Custom VPC network. | `string` | `"default"` | no |
| <a name="input_fwr_ports"></a> [fwr\_ports](#input\_fwr\_ports) | Traffic protocol. | `list` | <pre>[<br/>  "22"<br/>]</pre> | no |
| <a name="input_fwr_protocol"></a> [fwr\_protocol](#input\_fwr\_protocol) | Traffic protocol. | `string` | `"tcp"` | no |
| <a name="input_fwr_rules"></a> [fwr\_rules](#input\_fwr\_rules) | List of custom rule definitions (refer to variables file for syntax). | <pre>list(object({<br/>    fwr_name                    = string<br/>    fwr_description             = string<br/>    fwr_direction               = string<br/>    fwr_priority                = number<br/>    fwr_source_ranges                  = list(string)<br/>    fwr_source_tags             = list(string)<br/>    fwr_source_service_accounts = list(string)<br/>    fwr_target_tags             = list(string)<br/>    fwr_target_service_accounts = list(string)<br/>    allow = list(object({<br/>      protocol = string<br/>      ports    = list(string)<br/>    }))<br/>    deny = list(object({<br/>      protocol = string<br/>      ports    = list(string)<br/>    }))<br/>    log_config = object({<br/>      metadata = string<br/>    })<br/>  }))</pre> | `[]` | no |
| <a name="input_fwr_source_range"></a> [fwr\_source\_range](#input\_fwr\_source\_range) | Network range. | `list` | <pre>[<br/>  "0.0.0.0/0"<br/>]</pre> | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

No outputs.
