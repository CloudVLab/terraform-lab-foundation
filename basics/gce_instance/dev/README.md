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
| [google_compute_instance.gce_virtual_machine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gce_assign_external_ip"></a> [gce\_assign\_external\_ip](#input\_gce\_assign\_external\_ip) | Enable an external IP | `bool` | `true` | no |
| <a name="input_gce_can_ip_forward"></a> [gce\_can\_ip\_forward](#input\_gce\_can\_ip\_forward) | Allow IP forwarding | `bool` | `false` | no |
| <a name="input_gce_machine_image"></a> [gce\_machine\_image](#input\_gce\_machine\_image) | GCE virtual machine image | `string` | `"debian-cloud/debian-11"` | no |
| <a name="input_gce_machine_network"></a> [gce\_machine\_network](#input\_gce\_machine\_network) | GCE virtual machine network | `string` | `"default"` | no |
| <a name="input_gce_machine_type"></a> [gce\_machine\_type](#input\_gce\_machine\_type) | Machine type to use for GCE | `string` | `"n1-standard-1"` | no |
| <a name="input_gce_metadata"></a> [gce\_metadata](#input\_gce\_metadata) | GCE Metadata object | `map(string)` | <pre>{<br>  "foo": "bar"<br>}</pre> | no |
| <a name="input_gce_name"></a> [gce\_name](#input\_gce\_name) | GCE VM instance name. | `string` | `"tf-test-gce"` | no |
| <a name="input_gce_region"></a> [gce\_region](#input\_gce\_region) | Region to create resources in. | `string` | `"us-central1"` | no |
| <a name="input_gce_scopes"></a> [gce\_scopes](#input\_gce\_scopes) | GCE service account scope | `list(string)` | <pre>[<br>  "cloud-platform"<br>]</pre> | no |
| <a name="input_gce_service_account"></a> [gce\_service\_account](#input\_gce\_service\_account) | GCE Service Account | `string` | `"default"` | no |
| <a name="input_gce_startup_script"></a> [gce\_startup\_script](#input\_gce\_startup\_script) | GCE startup script | `string` | `"echo Welcome to Project Octopus > /tmp/octopus.txt"` | no |
| <a name="input_gce_tags"></a> [gce\_tags](#input\_gce\_tags) | GCE virtual machine tags | `list(string)` | <pre>[<br>  "lab-vm"<br>]</pre> | no |
| <a name="input_gce_zone"></a> [gce\_zone](#input\_gce\_zone) | Zone to create resources in. | `string` | `"us-central1-f"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_username"></a> [gcp\_username](#input\_gcp\_username) | Name of Qwiklabs user | `string` | `"qwiklabs-student"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gce_external_ip"></a> [gce\_external\_ip](#output\_gce\_external\_ip) | External IP address of GCE instance |
| <a name="output_gce_instance_name"></a> [gce\_instance\_name](#output\_gce\_instance\_name) | Name of the GCE instance |
