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
| [google_bigquery_job.job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_job) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bq_dataset_id"></a> [bq\_dataset\_id](#input\_bq\_dataset\_id) | The name of the dataset | `string` | `""` | no |
| <a name="input_bq_job_autodetect"></a> [bq\_job\_autodetect](#input\_bq\_job\_autodetect) | Auto detect format | `bool` | `true` | no |
| <a name="input_bq_job_format"></a> [bq\_job\_format](#input\_bq\_job\_format) | Source formate | `string` | `"CSV"` | no |
| <a name="input_bq_job_id"></a> [bq\_job\_id](#input\_bq\_job\_id) | Name of the table. | `string` | `"job1"` | no |
| <a name="input_bq_job_label"></a> [bq\_job\_label](#input\_bq\_job\_label) | Label for the job to be performed. | `map` | <pre>{<br>  "my_job": "lab_job"<br>}</pre> | no |
| <a name="input_bq_job_skip_row"></a> [bq\_job\_skip\_row](#input\_bq\_job\_skip\_row) | Source formate | `number` | `0` | no |
| <a name="input_bq_job_source"></a> [bq\_job\_source](#input\_bq\_job\_source) | Name of the table. | `list` | <pre>[<br>  "gs://spls/test.csv"<br>]</pre> | no |
| <a name="input_bq_job_write"></a> [bq\_job\_write](#input\_bq\_job\_write) | Write disposition | `string` | `"WRITE_APPEND"` | no |
| <a name="input_bq_location"></a> [bq\_location](#input\_bq\_location) | Region to create resources in. | `string` | `"US"` | no |
| <a name="input_bq_table_id"></a> [bq\_table\_id](#input\_bq\_table\_id) | Name of the table. | `string` | `"ttable"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

No outputs.
