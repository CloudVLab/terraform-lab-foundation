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
## Ensure these values are defined in Qwiklabs.yaml

## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------
# Default value passed in
variable "bq_location" {
  type        = string
  description = "Region to create resources in."
  default     = "US"
}

