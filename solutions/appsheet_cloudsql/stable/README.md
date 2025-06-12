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
| [google_sql_database.database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.mysql](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_sql_db_name"></a> [sql\_db\_name](#input\_sql\_db\_name) | Name of Cloud SQL instance | `string` | `"mysql"` | no |
| <a name="input_sql_db_version"></a> [sql\_db\_version](#input\_sql\_db\_version) | Version of Cloud SQL instance | `string` | `"MYSQL_5_7"` | no |
| <a name="input_sql_user_host"></a> [sql\_user\_host](#input\_sql\_user\_host) | Cloud SQL host access | `string` | `"%"` | no |
| <a name="input_sql_user_name"></a> [sql\_user\_name](#input\_sql\_user\_name) | Name of Cloud SQL user | `string` | `"appsheet-user"` | no |
| <a name="input_sql_user_password"></a> [sql\_user\_password](#input\_sql\_user\_password) | Cloud SQL instance user password | `string` | `"Password01"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_sql_instance"></a> [cloud\_sql\_instance](#output\_cloud\_sql\_instance) | Object instance |
| <a name="output_cloud_sql_private_ip"></a> [cloud\_sql\_private\_ip](#output\_cloud\_sql\_private\_ip) | Object instance |
| <a name="output_cloud_sql_public_ip"></a> [cloud\_sql\_public\_ip](#output\_cloud\_sql\_public\_ip) | Object instance |
