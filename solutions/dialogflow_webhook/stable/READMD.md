## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_la_firestore_415"></a> [la\_firestore\_415](#module\_la\_firestore\_415) | github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable | n/a |
| <a name="module_la_firestore_650"></a> [la\_firestore\_650](#module\_la\_firestore\_650) | github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable | n/a |
| <a name="module_la_firestore_925"></a> [la\_firestore\_925](#module\_la\_firestore\_925) | github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable | n/a |
| <a name="module_la_firestore_classical"></a> [la\_firestore\_classical](#module\_la\_firestore\_classical) | github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable | n/a |
| <a name="module_la_firestore_pop"></a> [la\_firestore\_pop](#module\_la\_firestore\_pop) | github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable | n/a |
| <a name="module_la_firestore_rock"></a> [la\_firestore\_rock](#module\_la\_firestore\_rock) | github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable | n/a |
| <a name="module_la_gae"></a> [la\_gae](#module\_la\_gae) | github.com/CloudVLab/terraform-lab-foundation//basics/app_engine/stable | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ac_data_415"></a> [ac\_data\_415](#input\_ac\_data\_415) | n/a | `map` | <pre>{<br/>  "first_name": {<br/>    "stringValue": "Nozomi"<br/>  },<br/>  "last_name": {<br/>    "stringValue": "Hernandez"<br/>  },<br/>  "pin": {<br/>    "stringValue": "1111"<br/>  },<br/>  "tier": {<br/>    "stringValue": "platinum"<br/>  }<br/>}</pre> | no |
| <a name="input_ac_data_650"></a> [ac\_data\_650](#input\_ac\_data\_650) | n/a | `map` | <pre>{<br/>  "first_name": {<br/>    "stringValue": "Chitra"<br/>  },<br/>  "last_name": {<br/>    "stringValue": "Wang"<br/>  },<br/>  "pin": {<br/>    "stringValue": "3333"<br/>  },<br/>  "tier": {<br/>    "stringValue": "silver"<br/>  }<br/>}</pre> | no |
| <a name="input_ac_data_925"></a> [ac\_data\_925](#input\_ac\_data\_925) | n/a | `map` | <pre>{<br/>  "first_name": {<br/>    "stringValue": "Mohammed"<br/>  },<br/>  "last_name": {<br/>    "stringValue": "Devi"<br/>  },<br/>  "pin": {<br/>    "stringValue": "2222"<br/>  },<br/>  "tier": {<br/>    "stringValue": "gold"<br/>  }<br/>}</pre> | no |
| <a name="input_collection_accounts"></a> [collection\_accounts](#input\_collection\_accounts) | Accounts Variables #------------------------------------------------------------ | `string` | `"accounts"` | no |
| <a name="input_collection_most_played"></a> [collection\_most\_played](#input\_collection\_most\_played) | Most Played Variables #------------------------------------------------------------ | `string` | `"most_played"` | no |
| <a name="input_document_415"></a> [document\_415](#input\_document\_415) | n/a | `string` | `"4155551212"` | no |
| <a name="input_document_650"></a> [document\_650](#input\_document\_650) | n/a | `string` | `"6505551212"` | no |
| <a name="input_document_925"></a> [document\_925](#input\_document\_925) | n/a | `string` | `"9255551212"` | no |
| <a name="input_document_classical"></a> [document\_classical](#input\_document\_classical) | n/a | `string` | `"classical"` | no |
| <a name="input_document_pop"></a> [document\_pop](#input\_document\_pop) | n/a | `string` | `"pop"` | no |
| <a name="input_document_rock"></a> [document\_rock](#input\_document\_rock) | n/a | `string` | `"rock"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | Qwiklabs Mandatory Values | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | n/a | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | n/a | `string` | n/a | yes |
| <a name="input_mp_data_classical"></a> [mp\_data\_classical](#input\_mp\_data\_classical) | n/a | `map` | <pre>{<br/>  "composer": {<br/>    "stringValue": "Wolfgang Mozart"<br/>  },<br/>  "title": {<br/>    "stringValue": "Serenade No 13 for strings in G major"<br/>  }<br/>}</pre> | no |
| <a name="input_mp_data_pop"></a> [mp\_data\_pop](#input\_mp\_data\_pop) | n/a | `map` | <pre>{<br/>  "composer": {<br/>    "stringValue": "Wiz Khalifa"<br/>  },<br/>  "title": {<br/>    "stringValue": "See You Soon"<br/>  }<br/>}</pre> | no |
| <a name="input_mp_data_rock"></a> [mp\_data\_rock](#input\_mp\_data\_rock) | n/a | `map` | <pre>{<br/>  "composer": {<br/>    "stringValue": "Led Zeppelin"<br/>  },<br/>  "title": {<br/>    "stringValue": "Stairway to Heaven"<br/>  }<br/>}</pre> | no |

## Outputs

No outputs.
