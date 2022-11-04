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


## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------

# Default value passed in
variable "gcf_name" {
  type        = string
  description = "Name of the Cloud Function."
  default     = "test_function"
}

variable "gcf_description" {
  type        = string
  description = "Description of the Cloud Function."
  default     = "Test function description"
}

variable "gcf_runtime" {
  type        = string
  description = "Runtime of the Cloud Function."
  default     = "nodejs16"
}

variable "gcf_target_bucket" {
  type        = string
  description = "Target bucket to upload source code."
  default     = "mybucket"
}

variable "gcf_local_source" {
  type        = string
  description = "Source location for Cloud Function."
  default     = "./cf/function.zip"
}

variable "gcf_entry_point" {
  type        = string
  description = "Runtime of the Cloud Function."
  default     = "helloCF"
}

