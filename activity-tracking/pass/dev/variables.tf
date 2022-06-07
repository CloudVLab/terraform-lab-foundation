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

# Expected custom_properties key to be declared in `qwiklabs.yaml` 
# with the same name for any lab that uses this script.
variable "api_service_name" {
  type        = string
  description = "Googleapis service name."
}

# with the same name for any lab that uses this script.
variable "api_service_deny" {
  type        = string
  description = "Name of Qwiklabs user"
  default     = false
}
