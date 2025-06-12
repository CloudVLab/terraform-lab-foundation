## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudbuild_script"></a> [cloudbuild\_script](#module\_cloudbuild\_script) | terraform-google-modules/gcloud/google | ~> 3.0.1 |
| <a name="module_la_api_batch"></a> [la\_api\_batch](#module\_la\_api\_batch) | github.com/CloudVLab/terraform-lab-foundation//basics/api_service/dev | n/a |
| <a name="module_la_sa_role"></a> [la\_sa\_role](#module\_la\_sa\_role) | github.com/CloudVLab/terraform-lab-foundation//basics/iam_sa_role/stable | n/a |

## Resources

| Name | Type |
|------|------|
| [google_container_cluster.gke](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_username"></a> [gcp\_username](#input\_gcp\_username) | The lab username | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gke_cluster_name"></a> [gke\_cluster\_name](#input\_gke\_cluster\_name) | cluster name for GKE | `string` | n/a | yes |
| <a name="input_service_account_key_file"></a> [service\_account\_key\_file](#input\_service\_account\_key\_file) | key file location | `string` | n/a | yes |

## Outputs

No outputs.
