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
| [google_storage_bucket.cloud-bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_username"></a> [gcp\_username](#input\_gcp\_username) | Name of Qwiklabs user | `string` | `"qwiklabs-student"` | no |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gcs_append_project"></a> [gcs\_append\_project](#input\_gcs\_append\_project) | Enable uniform bucket level access | `bool` | `true` | no |
| <a name="input_gcs_bucket_extension"></a> [gcs\_bucket\_extension](#input\_gcs\_bucket\_extension) | GCS Bucket name. | `string` | `"bucket"` | no |
| <a name="input_gcs_bucket_level_access"></a> [gcs\_bucket\_level\_access](#input\_gcs\_bucket\_level\_access) | Append the Project ID to bucket name | `bool` | `true` | no |
| <a name="input_gcs_force_destroy"></a> [gcs\_force\_destroy](#input\_gcs\_force\_destroy) | Delete bucket contents on destroy | `bool` | `true` | no |
| <a name="input_gcs_storage_class"></a> [gcs\_storage\_class](#input\_gcs\_storage\_class) | GCS Bucket name. | `string` | `"STANDARD"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcs_bucket_name"></a> [gcs\_bucket\_name](#output\_gcs\_bucket\_name) | Name of the GCS Bucket |
