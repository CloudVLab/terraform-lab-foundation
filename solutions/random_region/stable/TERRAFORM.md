## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_shuffle.custom_regions](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/shuffle) | resource |
| [random_string.shuffle_seed](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_allowed_locations"></a> [gcp\_allowed\_locations](#input\_gcp\_allowed\_locations) | List of Regions to be used | `list(string)` | <pre>[<br/>  "us-central1",<br/>  "us-east1",<br/>  "us-east4",<br/>  "us-west1"<br/>]</pre> | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP project ID to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | Region to create resources in. | `string` | n/a | yes |
| <a name="input_gcp_zone"></a> [gcp\_zone](#input\_gcp\_zone) | Zone to create resources in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp_primary_region"></a> [gcp\_primary\_region](#output\_gcp\_primary\_region) | # --------------------------------------------------------------------------- # REGION LIST ITEM Create an output variable for the random zone |
| <a name="output_gcp_region_list"></a> [gcp\_region\_list](#output\_gcp\_region\_list) | # --------------------------------------------------------------------------- # REGION LISTS Create an output variable for filtered\_zones list |
| <a name="output_gcp_region_list2"></a> [gcp\_region\_list2](#output\_gcp\_region\_list2) | Create an output variable for filtered\_zones list |
| <a name="output_gcp_secondary_region"></a> [gcp\_secondary\_region](#output\_gcp\_secondary\_region) | n/a |
| <a name="output_gcp_tertiary_region"></a> [gcp\_tertiary\_region](#output\_gcp\_tertiary\_region) | n/a |
