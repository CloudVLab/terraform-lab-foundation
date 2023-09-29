# Terraform: Random Region 

| Channel | Status |
|---------|--------|
| Stable  | ![CloudBuild]() |
| Beta    | ![CloudBuild]() |

Create a list of regions based on user defined allowed_location list.
The region value presented is subject to randomisation.

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

#### Qwiklabs Properties
```
gcp_project_id = "my-gcp-project"
gcp_region     = "us-central1"
gcp_zone       = "us-central1-a"
```

#### Custom Properties
```
gcp_allowed_locations = [ "us-central1", "us-east1", "us-east4", "us-west1" ] 
```
__NOTE:__
- [x] Content author is required to define the value for `gcp_allowed_locations` variable.  
- [x] Content author should ensure each `gcp_allowed_locations` variable is distinct.  

## Example

View the [example configuration](https://github.com/CloudVLab/terraform-lab-foundation/tree/main/solutions/random_region/example) to get started.

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| gcp_primary_region | The value taken from var.gcp_region |
| gcp_secondary_region | A distinct custom value based on the gcp_allowed_locations variable |
| gcp_tertiary_region | A distinct custom value based on the gcp_allowed_locations variable |

## Adding a Commit 

Commits to the repository will initiate the automated QA process

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
