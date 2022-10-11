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
## Output variable definitions - Override from Custom Properties 
## --------------------------------------------------------------

# with the same name for any lab that uses this script.
# Expected custom_properties key to be declared in `qwiklabs.yaml` 
# with the same name for any lab that uses this script.
variable "apigee_name" {
  type        = string
  description = "Apigee Network Name."
  default     = "apigee-network"
}

variable "region_name" {
  type        = string
  description = "Apigee Region Name."
  default     = "us-central1"
}