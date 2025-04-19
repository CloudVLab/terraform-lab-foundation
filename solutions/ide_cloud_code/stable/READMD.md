## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_la_api_batch"></a> [la\_api\_batch](#module\_la\_api\_batch) | github.com/CloudVLab/terraform-lab-foundation//basics/api_service/dev | n/a |
| <a name="module_la_fw"></a> [la\_fw](#module\_la\_fw) | github.com/CloudVLab/terraform-lab-foundation//basics/vpc_firewall/stable | n/a |
| <a name="module_la_gce"></a> [la\_gce](#module\_la\_gce) | github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable | n/a |
| <a name="module_la_vpc"></a> [la\_vpc](#module\_la\_vpc) | github.com/CloudVLab/terraform-lab-foundation//basics/vpc_network/stable | n/a |

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_service_iam_binding.public](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_binding) | resource |
| [google_cloud_run_v2_service.ide](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service) | resource |
| [google_compute_image.image_family](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gceInstanceName"></a> [gceInstanceName](#input\_gceInstanceName) | GCE virtual machine image family | `string` | `"cloudlearningservices"` | no |
| <a name="input_gceInstanceNetwork"></a> [gceInstanceNetwork](#input\_gceInstanceNetwork) | GCE virtual machine network | `string` | `"default"` | no |
| <a name="input_gceInstanceScope"></a> [gceInstanceScope](#input\_gceInstanceScope) | GCE service account scope | `list(string)` | <pre>[<br/>  "cloud-platform"<br/>]</pre> | no |
| <a name="input_gceInstanceTags"></a> [gceInstanceTags](#input\_gceInstanceTags) | GCE virtual machine tags | `list(string)` | <pre>[<br/>  "lab-vm"<br/>]</pre> | no |
| <a name="input_gceInstanceZone"></a> [gceInstanceZone](#input\_gceInstanceZone) | Zone to create resources in. | `string` | `"us-central1-f"` | no |
| <a name="input_gceMachineImage"></a> [gceMachineImage](#input\_gceMachineImage) | GCE virtual machine image family | `string` | `"cloud-code-codeserver"` | no |
| <a name="input_gceMachineType"></a> [gceMachineType](#input\_gceMachineType) | Machine type to use for GCE | `string` | `"e2-standard-2"` | no |
| <a name="input_gceProjectMachineImage"></a> [gceProjectMachineImage](#input\_gceProjectMachineImage) | Project hosting the image family | `string` | `"qwiklabs-resources"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_username"></a> [gcp\_username](#input\_gcp\_username) | Name of Qwiklabs user | `string` | `"tester"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gcrContainerImage"></a> [gcrContainerImage](#input\_gcrContainerImage) | Container Image. | `string` | `"gcr.io/qwiklabs-resources/test-ide-proxy:latest"` | no |
| <a name="input_gcrIDEService"></a> [gcrIDEService](#input\_gcrIDEService) | Name of the proxy service | `string` | `"ide-service"` | no |
| <a name="input_gcrRegion"></a> [gcrRegion](#input\_gcrRegion) | GCE virtual machine image family | `string` | `"us-central1"` | no |
| <a name="input_gkeClusterName"></a> [gkeClusterName](#input\_gkeClusterName) | GKE Cluster name. | `string` | `"dev-cluster"` | no |
| <a name="input_gkeMasterIPv4CIDRBlock"></a> [gkeMasterIPv4CIDRBlock](#input\_gkeMasterIPv4CIDRBlock) | Custom properties with defaults | `string` | `"172.23.0.0/28"` | no |
| <a name="input_isCustomNetwork"></a> [isCustomNetwork](#input\_isCustomNetwork) | True to utilize custom network resources. False to switch to default network. | `bool` | `true` | no |
| <a name="input_isPrivateCluster"></a> [isPrivateCluster](#input\_isPrivateCluster) | True to spin up a private, secure cluster. False to spin up a public cluster. | `bool` | `true` | no |
| <a name="input_vpcDefaultCidr"></a> [vpcDefaultCidr](#input\_vpcDefaultCidr) | Network custom CIDR | `string` | `"10.128.0.0/9"` | no |
| <a name="input_vpcDescription"></a> [vpcDescription](#input\_vpcDescription) | Custom network | `string` | `"Lab custom network"` | no |
| <a name="input_vpcNetworkName"></a> [vpcNetworkName](#input\_vpcNetworkName) | Custom network | `string` | `"dev-network"` | no |
| <a name="input_vpcSubnetCidr"></a> [vpcSubnetCidr](#input\_vpcSubnetCidr) | Network custom CIDR | `string` | `"10.1.0.0/24"` | no |
| <a name="input_vpcSubnetName"></a> [vpcSubnetName](#input\_vpcSubnetName) | Custom network | `string` | `"dev-subnetwork"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ideEditorService"></a> [ideEditorService](#output\_ideEditorService) | URL of the IDE service |
| <a name="output_ideInstanceName"></a> [ideInstanceName](#output\_ideInstanceName) | Name of the GCE instance |
