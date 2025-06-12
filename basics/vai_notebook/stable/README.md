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
| [google_notebooks_instance.vertex_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/notebooks_instance) | resource |
| [google_project_iam_member.vertex_viewer_bind](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.aiplatform-api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.notebooks-api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_vai_image_family"></a> [vai\_image\_family](#input\_vai\_image\_family) | GCE image family | `string` | `"common-cpu-notebooks-debian-11"` | no |
| <a name="input_vai_machine_image"></a> [vai\_machine\_image](#input\_vai\_machine\_image) | GCE virtual machine image | `string` | `"deeplearning-platform-release"` | no |
| <a name="input_vai_machine_network"></a> [vai\_machine\_network](#input\_vai\_machine\_network) | GCE virtual machine network | `string` | `"default"` | no |
| <a name="input_vai_machine_type"></a> [vai\_machine\_type](#input\_vai\_machine\_type) | Machine type to use for GCE | `string` | `"e2-medium"` | no |
| <a name="input_vai_no_proxy_access"></a> [vai\_no\_proxy\_access](#input\_vai\_no\_proxy\_access) | Allow proxy access via SSH | `bool` | `false` | no |
| <a name="input_vai_no_public_access"></a> [vai\_no\_public\_access](#input\_vai\_no\_public\_access) | Allow proxy access via SSH | `bool` | `false` | no |
| <a name="input_vai_notebook_name"></a> [vai\_notebook\_name](#input\_vai\_notebook\_name) | Vertex VM instance name. | `string` | `"cloudlearningservices"` | no |
| <a name="input_vai_post_startup_script"></a> [vai\_post\_startup\_script](#input\_vai\_post\_startup\_script) | Path to a bash script to execute | `string` | `"gs://spls/lab-init.sh"` | no |
| <a name="input_vai_region"></a> [vai\_region](#input\_vai\_region) | Region to create resources in. | `string` | `"us-central1"` | no |
| <a name="input_vai_scopes"></a> [vai\_scopes](#input\_vai\_scopes) | GCE service account scope | `list(string)` | <pre>[<br>  "cloud-platform"<br>]</pre> | no |
| <a name="input_vai_tags"></a> [vai\_tags](#input\_vai\_tags) | GCE virtual machine tags | `list(string)` | <pre>[<br>  "lab-vm"<br>]</pre> | no |
| <a name="input_vai_zone"></a> [vai\_zone](#input\_vai\_zone) | Zone to create resources in. | `string` | `"us-central1-f"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_notebook_name"></a> [notebook\_name](#output\_notebook\_name) | Vertex VM instance name. |
