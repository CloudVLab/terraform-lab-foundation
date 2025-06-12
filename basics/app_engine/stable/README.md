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
| [google_app_engine_application.app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gae_db_type"></a> [gae\_db\_type](#input\_gae\_db\_type) | The type of database i.e. CLOUD\_FIRESTORE \| CLOUD\_DATASTORE\_COMPATIBILITY | `string` | `"CLOUD_FIRESTORE"` | no |
| <a name="input_gae_hasDatabase"></a> [gae\_hasDatabase](#input\_gae\_hasDatabase) | App Engine created with a Database. | `bool` | `false` | no |
| <a name="input_gae_location"></a> [gae\_location](#input\_gae\_location) | Location of App Engine to create resources in. | `string` | `"us-central"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

No outputs.
