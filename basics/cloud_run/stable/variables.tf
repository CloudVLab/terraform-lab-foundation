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

variable "gcrService" {
  type        = string
  description = "Name of the proxy service"
  default     = "automl-proxy"
}

variable "gcrRegion" {
  type        = string
  description = "GCE virtual machine image family"
  default     = "us-central1"
}

variable "gcrImage" {
  type        = string
  description = "GCE virtual machine image family"
  default     = "gcr.io/qwiklabs-resources/ide-proxy:latest"
}

variable "gcrEnvs" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = []
  type = list(object({
    gcr_env_name  = string
    gcr_env_value = string
  }))
}

