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
| [google_bigquery_dataset.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bq_dataset_description"></a> [bq\_dataset\_description](#input\_bq\_dataset\_description) | Description of the dataset. | `string` | `"tdataset for lab environment"` | no |
| <a name="input_bq_dataset_friendly_name"></a> [bq\_dataset\_friendly\_name](#input\_bq\_dataset\_friendly\_name) | Friendly Name of the dataset. | `string` | `"tdataset"` | no |
| <a name="input_bq_dataset_id"></a> [bq\_dataset\_id](#input\_bq\_dataset\_id) | Name of the dataset. | `string` | `"tdataset"` | no |
| <a name="input_bq_location"></a> [bq\_location](#input\_bq\_location) | Region to create resources in. | `string` | `"US"` | no |
| <a name="input_bq_table_expiration"></a> [bq\_table\_expiration](#input\_bq\_table\_expiration) | Table expiration set to default | `number` | `3600000` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bq_dataset_id"></a> [bq\_dataset\_id](#output\_bq\_dataset\_id) | Name of the BigQuery dataset |
