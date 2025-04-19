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
| <a name="module_la_serverless_vpc_access"></a> [la\_serverless\_vpc\_access](#module\_la\_serverless\_vpc\_access) | github.com/CloudVLab/terraform-lab-foundation//basics/vpc_connector/stable | n/a |
| <a name="module_la_vpc"></a> [la\_vpc](#module\_la\_vpc) | github.com/CloudVLab/terraform-lab-foundation//basics/vpc_network/stable | n/a |

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_service.browser](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service) | resource |
| [google_cloud_run_service.ide](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service) | resource |
| [google_cloud_run_service_iam_policy.browser_noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_policy) | resource |
| [google_cloud_run_service_iam_policy.ide_noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_policy) | resource |
| [google_project_service.run](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_compute_image.image_family](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |
| [google_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gceDiskSize"></a> [gceDiskSize](#input\_gceDiskSize) | Size of disk to be allocated | `number` | `100` | no |
| <a name="input_gceInstanceName"></a> [gceInstanceName](#input\_gceInstanceName) | Name of virtual machine. | `string` | `"cloudlearningservices"` | no |
| <a name="input_gceInstanceNetwork"></a> [gceInstanceNetwork](#input\_gceInstanceNetwork) | GCE virtual machine network | `string` | `"default"` | no |
| <a name="input_gceInstanceScope"></a> [gceInstanceScope](#input\_gceInstanceScope) | GCE service account scope | `list(string)` | <pre>[<br/>  "cloud-platform"<br/>]</pre> | no |
| <a name="input_gceInstanceTags"></a> [gceInstanceTags](#input\_gceInstanceTags) | GCE virtual machine tags | `list(string)` | <pre>[<br/>  "lab-vm"<br/>]</pre> | no |
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
| <a name="output_ideBrowserService"></a> [ideBrowserService](#output\_ideBrowserService) | URL of the Browser service |
| <a name="output_ideEditorService"></a> [ideEditorService](#output\_ideEditorService) | URL of the IDE service |
| <a name="output_ideInstanceName"></a> [ideInstanceName](#output\_ideInstanceName) | Name of the GCE instance |
| <a name="output_vpcNetworkName"></a> [vpcNetworkName](#output\_vpcNetworkName) | Name of the GCE instance |
