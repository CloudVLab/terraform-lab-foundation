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

variable "gcp_user_id" {
  type        = string
  description = "User Id"
}

variable "sme_notebook_name" {
  type        = string
  description = "Notebook name"
  default     = "generative-ai-jupyterlab"
}

variable "sme_machine_type" {
  type        = string
  description = "Notebook machine type"
  default     = "n1-standard-4"
}

variable "sme_image_project" {
  type        = string
  description = "Machine image project"
  default     = "deeplearning-platform-release"
}

variable "sme_image_family" {
  type        = string
  description = "Machine image family"
  default     = "tf-ent-2-11-cu113-notebooks-debian-11-py310"
}


