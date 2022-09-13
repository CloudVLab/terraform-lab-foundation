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

variable "gsr_name" {
  type        = string
  description = "Name of the Source Repository"
  default     = "lab-repo"
}
