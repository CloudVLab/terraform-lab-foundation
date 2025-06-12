## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_la_cloud_run"></a> [la\_cloud\_run](#module\_la\_cloud\_run) | github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gceDiskSize"></a> [gceDiskSize](#input\_gceDiskSize) | Size of disk to be allocated | `number` | `100` | no |
| <a name="input_gceInstanceName"></a> [gceInstanceName](#input\_gceInstanceName) | Name of virtual machine. | `string` | `"cloudlearningservices"` | no |
| <a name="input_gceInstanceNetwork"></a> [gceInstanceNetwork](#input\_gceInstanceNetwork) | GCE virtual machine network | `string` | `"default"` | no |
| <a name="input_gceInstanceScope"></a> [gceInstanceScope](#input\_gceInstanceScope) | GCE service account scope | `list(string)` | <pre>[<br>  "cloud-platform"<br>]</pre> | no |
| <a name="input_gceInstanceTags"></a> [gceInstanceTags](#input\_gceInstanceTags) | GCE virtual machine tags | `list(string)` | <pre>[<br>  "lab-vm"<br>]</pre> | no |
| <a name="input_gceInstanceZone"></a> [gceInstanceZone](#input\_gceInstanceZone) | Zone to create resources in. | `string` | `"us-central1-f"` | no |
| <a name="input_gceMachineImage"></a> [gceMachineImage](#input\_gceMachineImage) | GCE virtual machine image family | `string` | `"ide-codeserver"` | no |
| <a name="input_gceMachineType"></a> [gceMachineType](#input\_gceMachineType) | Machine type to use for GCE | `string` | `"e2-standard-2"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_username"></a> [gcp\_username](#input\_gcp\_username) | Name of Qwiklabs user | `string` | `"tester"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gcrRegion"></a> [gcrRegion](#input\_gcrRegion) | Region to create resources in. | `string` | `"us-central1"` | no |
| <a name="input_vpcConnectorMachineType"></a> [vpcConnectorMachineType](#input\_vpcConnectorMachineType) | VPC Access Connector Machine Type | `string` | `"e2-micro"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | Terraform Output values |
