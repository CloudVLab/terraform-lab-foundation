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
## Variable definitions - Override from Custom Properties 
## --------------------------------------------------------------

# with the same name for any lab that uses this script.
variable "iam_user" {
  type        = string
  description = "Name of Qwiklabs user"
  default     = "tester@gmail.com" 
}

## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------

# with the same name for any lab that uses this script.
variable "iam_sa_name" {
  type        = string
  description = "Role to bind to the user account"
  default     = "tester-qwiklabs" 
}

# with the same name for any lab that uses this script.
variable "iam_sa_description" {
  type        = string
  description = "Custom Service Account for IAM binding"
  default     = "Custom service account" 
}

# with the same name for any lab that uses this script.
variable "iam_sa_display" {
  type        = string
  description = "Display name for the SA"
  default     = "tester-qwiklabs account" 
}

# with the same name for any lab that uses this script.
variable "iam_sa" {
  type        = string
  description = "Display name for the SA"
  default     = "tester-qwiklabs account" 
}

# with the same name for any lab that uses this script.
variable "iam_role" {
  type        = string
  description = "Role to bind to the user account"
  default     = "roles/viewer" 
}
