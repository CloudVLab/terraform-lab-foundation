## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gceImageProject"></a> [gceImageProject](#input\_gceImageProject) | Project owner for Vertex image | `string` | `"deeplearning-platform-release"` | no |
| <a name="input_gceInstanceImage"></a> [gceInstanceImage](#input\_gceInstanceImage) | GCE Image family | `string` | `"common-cpu-notebooks-debian-11"` | no |
| <a name="input_gceInstanceName"></a> [gceInstanceName](#input\_gceInstanceName) | Name of virtual machine. | `string` | `"cloudlearningservices"` | no |
| <a name="input_gceInstanceNetwork"></a> [gceInstanceNetwork](#input\_gceInstanceNetwork) | GCE virtual machine network | `string` | `"default"` | no |
| <a name="input_gceInstanceScope"></a> [gceInstanceScope](#input\_gceInstanceScope) | GCE service account scope | `list(string)` | <pre>[<br>  "cloud-platform"<br>]</pre> | no |
| <a name="input_gceInstanceTags"></a> [gceInstanceTags](#input\_gceInstanceTags) | GCE virtual machine tags | `list(string)` | <pre>[<br>  "lab-vm"<br>]</pre> | no |
| <a name="input_gceInstanceZone"></a> [gceInstanceZone](#input\_gceInstanceZone) | Zone to create resources in. | `string` | `"us-central1-f"` | no |
| <a name="input_gceMachineType"></a> [gceMachineType](#input\_gceMachineType) | Machine type to use for GCE | `string` | `"e2-medium"` | no |
| <a name="input_gcePostStartupScript"></a> [gcePostStartupScript](#input\_gcePostStartupScript) | Vertex post startup-script via public URL | `string` | `"https://storage.googleapis.com/spls/poc004/lab-init.sh"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gcrGoogleService"></a> [gcrGoogleService](#input\_gcrGoogleService) | Google APIs Cloud Run Service. | `string` | `"run.googleapis.com"` | no |
| <a name="input_gcrImagePrimary"></a> [gcrImagePrimary](#input\_gcrImagePrimary) | Image to be run by Cloud Run | `string` | `"gcr.io/qwiklabs-resources/notebook-proxy:latest"` | no |
| <a name="input_gcrMemberPermission"></a> [gcrMemberPermission](#input\_gcrMemberPermission) | Assign member IAM permissions | `string` | `"allUsers"` | no |
| <a name="input_gcrRegion"></a> [gcrRegion](#input\_gcrRegion) | Region to create resources in. | `string` | `"us-central1"` | no |
| <a name="input_gcrRolePermission"></a> [gcrRolePermission](#input\_gcrRolePermission) | Assign role IAM permissions | `string` | `"roles/run.invoker"` | no |
| <a name="input_gcrServiceName"></a> [gcrServiceName](#input\_gcrServiceName) | Name of the Cloud Run. | `string` | `"workbench-service"` | no |
| <a name="input_machine_image"></a> [machine\_image](#input\_machine\_image) | GCE virtual machine image | `string` | `"debian-cloud/debian-11"` | no |
| <a name="input_machine_network"></a> [machine\_network](#input\_machine\_network) | GCE virtual machine network | `string` | `"default"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Machine type to use for GCE | `string` | `"n1-standard-1"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Region to create resources in. | `string` | `"cls-notebook"` | no |
| <a name="input_vm_region"></a> [vm\_region](#input\_vm\_region) | Region to create resources in. | `string` | `"us-central1"` | no |
| <a name="input_vm_scopes"></a> [vm\_scopes](#input\_vm\_scopes) | GCE service account scope | `list(string)` | <pre>[<br>  "cloud-platform"<br>]</pre> | no |
| <a name="input_vm_tags"></a> [vm\_tags](#input\_vm\_tags) | GCE virtual machine tags | `list(string)` | <pre>[<br>  "lab-vm"<br>]</pre> | no |
| <a name="input_vm_zone"></a> [vm\_zone](#input\_vm\_zone) | Zone to create resources in. | `string` | `"us-central1-a"` | no |
| <a name="input_vpcConnectorMachineType"></a> [vpcConnectorMachineType](#input\_vpcConnectorMachineType) | VPC Access Connector Machine Type | `string` | `"e2-micro"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_notebook_service_url"></a> [notebook\_service\_url](#output\_notebook\_service\_url) | URL of the Proxy service |
