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
variable "gcp_username" {
  type        = string
  description = "Name of Qwiklabs user"
  default     = "qwiklabs-student"
}

variable "gcs_bucket_extension" {
  type        = string
  description = "GCS Bucket name."
  default     = "bucket"
}

variable "gcs_storage_class" {
  type        = string
  description = "GCS Bucket name."
  default     = "STANDARD"
}

variable "gcs_append_project" {
  type        = bool
  description = "Enable uniform bucket level access"
  default     = true
}

variable "gcs_force_destroy" {
  type        = bool
  description = "Delete bucket contents on destroy"
  default     = true
}

variable "gcs_bucket_level_access" {
  type        = bool
  description = "Append the Project ID to bucket name"
  default     = true
}

