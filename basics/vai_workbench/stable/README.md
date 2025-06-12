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
| [google_workbench_instance.instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workbench_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_vai_disable_proxy_access"></a> [vai\_disable\_proxy\_access](#input\_vai\_disable\_proxy\_access) | Allow proxy access via SSH | `bool` | `true` | no |
| <a name="input_vai_disable_public_ip"></a> [vai\_disable\_public\_ip](#input\_vai\_disable\_public\_ip) | Disable the public IP for the workbench | `bool` | `false` | no |
| <a name="input_vai_enable_ip_forwarding"></a> [vai\_enable\_ip\_forwarding](#input\_vai\_enable\_ip\_forwarding) | IP forward | `bool` | `true` | no |
| <a name="input_vai_machine_network"></a> [vai\_machine\_network](#input\_vai\_machine\_network) | GCE virtual machine network | `string` | `null` | no |
| <a name="input_vai_machine_subnet"></a> [vai\_machine\_subnet](#input\_vai\_machine\_subnet) | GCE virtual machine network | `string` | `null` | no |
| <a name="input_vai_machine_type"></a> [vai\_machine\_type](#input\_vai\_machine\_type) | Machine type to use for GCE | `string` | `"e2-medium"` | no |
| <a name="input_vai_network_nic_type"></a> [vai\_network\_nic\_type](#input\_vai\_network\_nic\_type) | Network Interface Card type | `string` | `"VIRTIO_NET"` | no |
| <a name="input_vai_network_stack_type"></a> [vai\_network\_stack\_type](#input\_vai\_network\_stack\_type) | Network stack IPV4 or IPV6 | `string` | `"IPV4_ONLY"` | no |
| <a name="input_vai_post_startup_script"></a> [vai\_post\_startup\_script](#input\_vai\_post\_startup\_script) | Path to a bash script to execute | `string` | `"https://storage.googleapis.com/spls/tlf-workbench/lab-init.sh"` | no |
| <a name="input_vai_tags"></a> [vai\_tags](#input\_vai\_tags) | Vertex Workbench virtual machine tags | `list(string)` | <pre>[<br>  "tlf",<br>  "cls",<br>  "lab-vm"<br>]</pre> | no |
| <a name="input_vai_workbench_name"></a> [vai\_workbench\_name](#input\_vai\_workbench\_name) | Vertex VM instance name. | `string` | `"cloudlearningservices"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workbench_name"></a> [workbench\_name](#output\_workbench\_name) | Vertex Workbench name. |
| <a name="output_workbench_proxy_uri"></a> [workbench\_proxy\_uri](#output\_workbench\_proxy\_uri) | n/a |
