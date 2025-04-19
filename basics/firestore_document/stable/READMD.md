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
| [google_firestore_document.template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_document) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |
| <a name="input_gfd_collection_id"></a> [gfd\_collection\_id](#input\_gfd\_collection\_id) | Name of the Firestore Collection | `string` | `"collection_test"` | no |
| <a name="input_gfd_document_data"></a> [gfd\_document\_data](#input\_gfd\_document\_data) | n/a | `map` | <pre>{<br/>  "field_1": {<br/>    "stringValue": "Test Data"<br/>  },<br/>  "field_2": {<br/>    "stringValue": "Test Data"<br/>  }<br/>}</pre> | no |
| <a name="input_gfd_document_id"></a> [gfd\_document\_id](#input\_gfd\_document\_id) | Name of the Firestore Document | `string` | `"document_test"` | no |

## Outputs

No outputs.
