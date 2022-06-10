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
## Custom variable definitions - Override from Custom Properties 
## --------------------------------------------------------------

# Expected custom_properties key to be declared in `qwiklabs.yaml` 
# with the same name for any lab that uses this script.
variable "secret_manager_label" {
  type        = string
  description = "Label to be applied to the Secret."
  default     = "lab"
}

variable "secret_manager_identifier" {
  type        = string
  description = "Unique secret payload identifier."
  default     = "lab-secret"
}

variable "secret_manager_data" {
  type        = string
  description = "Label to be applied to the Secret."
  default     = "lab-data"
}
