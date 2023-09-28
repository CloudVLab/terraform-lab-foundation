## --------------------------------------------------------------
## Mandatory variable definitions
## --------------------------------------------------------------

variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to create resources in."
}

# Default value passed in
variable "gcp_region" {
  type        = string
  description = "Region to create resources in."
}

# Default value passed in
variable "gcp_zone" {
  type        = string
  description = "Zone to create resources in."
}

## --------------------------------------------------------------
## Variable definitions - Override from Custom Properties 
## --------------------------------------------------------------

variable "gcp_allowed_regions" {
  type = list(string) 
  description = "List of Regions to be used"
  default = [ "us-central1", "us-east1", "us-east4", "us-west1" ]
}
