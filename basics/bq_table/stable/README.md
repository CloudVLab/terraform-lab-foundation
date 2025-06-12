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
| [google_bigquery_table.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bq_dataset_id"></a> [bq\_dataset\_id](#input\_bq\_dataset\_id) | The name of the dataset | `string` | `""` | no |
| <a name="input_bq_table_description"></a> [bq\_table\_description](#input\_bq\_table\_description) | Description of the dataset. | `string` | `"tdataset for lab environment"` | no |
| <a name="input_bq_table_id"></a> [bq\_table\_id](#input\_bq\_table\_id) | Name of the table. | `string` | `"ttable"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bq_table_id"></a> [bq\_table\_id](#output\_bq\_table\_id) | Name of the BigQuery table id |
