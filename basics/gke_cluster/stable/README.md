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
| [google-beta_google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) | resource |
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_container_node_pool.primary_nodes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gke_cluster_name"></a> [gke\_cluster\_name](#input\_gke\_cluster\_name) | GKE Cluster name. | `string` | `"lab-cluster-test"` | no |
| <a name="input_gke_istio_auth"></a> [gke\_istio\_auth](#input\_gke\_istio\_auth) | GKE Istio authentication type | `string` | `"AUTH_NONE"` | no |
| <a name="input_gke_istio_disabled"></a> [gke\_istio\_disabled](#input\_gke\_istio\_disabled) | GKE Istio configuration - false = on | `bool` | `false` | no |
| <a name="input_gke_location"></a> [gke\_location](#input\_gke\_location) | Regional or Zonal | `string` | `"us-central1-a"` | no |
| <a name="input_gke_machine_network"></a> [gke\_machine\_network](#input\_gke\_machine\_network) | GCE virtual machine network | `string` | `"default"` | no |
| <a name="input_gke_machine_type"></a> [gke\_machine\_type](#input\_gke\_machine\_type) | GCE machine type | `string` | `"e2-standard-2"` | no |
| <a name="input_gke_num_nodes"></a> [gke\_num\_nodes](#input\_gke\_num\_nodes) | number of gke nodes | `number` | `2` | no |
| <a name="input_gke_scopes"></a> [gke\_scopes](#input\_gke\_scopes) | GCE service account scope | `list(string)` | <pre>[<br>  "https://www.googleapis.com/auth/logging.write",<br>  "https://www.googleapis.com/auth/monitoring"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gke_instance_name"></a> [gke\_instance\_name](#output\_gke\_instance\_name) | Name of the GKE instance |
