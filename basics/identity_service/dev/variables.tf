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

variable "identity_services" {
  type = list(string)
  default = [
    "compute.googleapis.com",
  ]
}

# with the same name for any lab that uses this script.
variable "identity_create_duration" {
  type        = string
  description = "Duration delay to apply post API enablement"
  default     = "60s"
}
