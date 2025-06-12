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
| [google_container_node_pool.tfer-gke_default-pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gkeClusterName"></a> [gkeClusterName](#input\_gkeClusterName) | GKE Cluster name. | `string` | `"dev-cluster"` | no |
| <a name="input_gkeDescription"></a> [gkeDescription](#input\_gkeDescription) | Description to apply to the cluster. | `string` | `"Lab cluster - using default description"` | no |
| <a name="input_gkeImageType"></a> [gkeImageType](#input\_gkeImageType) | Image Type to use. | `string` | `"COS_CONTAINERD"` | no |
| <a name="input_gkeInitialNodeCount"></a> [gkeInitialNodeCount](#input\_gkeInitialNodeCount) | Set the initial number of nodes | `string` | `"1"` | no |
| <a name="input_gkeIsAutopilot"></a> [gkeIsAutopilot](#input\_gkeIsAutopilot) | Set as True to utilize custom network resources. False to switch to default network. | `bool` | `false` | no |
| <a name="input_gkeIsBinAuth"></a> [gkeIsBinAuth](#input\_gkeIsBinAuth) | Set as True to enable Binary Authorization | `bool` | `false` | no |
| <a name="input_gkeIsCustomNetwork"></a> [gkeIsCustomNetwork](#input\_gkeIsCustomNetwork) | Set as True to utilize custom network resources. False to switch to default network. | `bool` | `false` | no |
| <a name="input_gkeIsPrivateCluster"></a> [gkeIsPrivateCluster](#input\_gkeIsPrivateCluster) | Set as True to spin up a private, secure cluster. False to spin up a public cluster. | `bool` | `true` | no |
| <a name="input_gkeIsPrivateEndpoint"></a> [gkeIsPrivateEndpoint](#input\_gkeIsPrivateEndpoint) | Set as True use the cluster private endpoint and disable public endpoint. False means cluster cluster/public endpoint can be used. | `bool` | `false` | no |
| <a name="input_gkeLabelMeshId"></a> [gkeLabelMeshId](#input\_gkeLabelMeshId) | Network route | `string` | `"mesh-12345"` | no |
| <a name="input_gkeMachineType"></a> [gkeMachineType](#input\_gkeMachineType) | Machine Type to use. | `string` | `"e2-standard-2"` | no |
| <a name="input_gkeMasterIPv4CIDRBlock"></a> [gkeMasterIPv4CIDRBlock](#input\_gkeMasterIPv4CIDRBlock) | GKE Master CIDR block | `string` | `"172.23.0.0/28"` | no |
| <a name="input_gkeModeRoutes"></a> [gkeModeRoutes](#input\_gkeModeRoutes) | Networking mode - Routes | `string` | `"ROUTES"` | no |
| <a name="input_gkeModeVpcNative"></a> [gkeModeVpcNative](#input\_gkeModeVpcNative) | Networking mode - VPC Native | `string` | `"VPC_NATIVE"` | no |
| <a name="input_gkeNetwork"></a> [gkeNetwork](#input\_gkeNetwork) | Network route | `string` | `"default"` | no |
| <a name="input_gkeNetworkingMode"></a> [gkeNetworkingMode](#input\_gkeNetworkingMode) | Set to true for VPC\_NATIVE (IP aliasing), false for ROUTES (default) | `bool` | `false` | no |
| <a name="input_gkePoolName"></a> [gkePoolName](#input\_gkePoolName) | Network route | `string` | `"pool-12345"` | no |
| <a name="input_gkeScopes"></a> [gkeScopes](#input\_gkeScopes) | OAuth Scope to be applied | `list` | <pre>[<br>  "cloud-platform"<br>]</pre> | no |
| <a name="input_gkeSubnetwork"></a> [gkeSubnetwork](#input\_gkeSubnetwork) | Network route | `string` | `"default"` | no |
| <a name="input_gkeWorkloadPool"></a> [gkeWorkloadPool](#input\_gkeWorkloadPool) | Network route | `string` | `"pool.svc.id.goog"` | no |

## Outputs

No outputs.
