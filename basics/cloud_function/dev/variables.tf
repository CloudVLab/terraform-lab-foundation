## --------------------------------------------------------------## Mandatory variable definitions
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
variable "gcs_bucket_extension" {
  type        = string
  description = "Name of the Cloud Function."
  default     = "bucket"
}

# Default value passed in
variable "gcf_archive_object" {
  type        = string
  description = "Name of the Cloud Function."
  default     = "function.zip"
}

# Default value passed in
variable "gcf_archive_source" {
  type        = string
  description = "Name of the Cloud Function."
  default     = "./cf/function.zip"
}

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

variable "gcf_entry_point" {
  type        = string
  description = "Runtime of the Cloud Function."
  default     = "helloCF"
}

variable "gcf_role_bind" {
  type        = string
  description = "IAM role binding."
  default     = "roles/cloudfunctions.invoker"
}

variable "gcf_member_account" {
  type        = string
  description = "IAM member account."
  default     = "allUsers"
}

variable "gcf_environment_variables" {
  type = map(string)

  default = {
    PROJECT_ID = "undefined"
  }
}

variable "gcf_registry" {
  type        = string
  description = "Registry type to use."
  default     = "ARTIFACT_REGISTRY"
  # default     = "CONTAINER_REGISTRY"
}

variable "gcf_available_mb" {
  type        = number
  description = "Amount of memory to allocate."
  default     = 128
}

variable "gcf_timeout" {
  type        = number
  description = "Cloud Function timeout delay, defaults to 60s."
  default     = 60
}

variable "gcf_trigger_http" {
  type        = bool
  description = "Trigger on http request."
  default     = true
}

variable "gcf_trigger_security" {
  type        = string
  description = "Redirect to HTTP URL, support query params."
  default     = "SECURE_ALWAYS"
}
