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
## Qwiklabs.yaml variable definitions - Override from Custom Properties 
## --------------------------------------------------------------

# Use this value to pass in Password value from `qwiklabs.yaml`
# variable "tfPassword" {
#   type        = string
#   description = "Cloud SQL Password."
# }

## --------------------------------------------------------------
## Optional variable definitions
## --------------------------------------------------------------


