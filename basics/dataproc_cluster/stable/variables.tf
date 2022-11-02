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

variable "machine_type"
{
  type        = string
  default     = "n1-standard-2"
}

variable "init_script"
{
  type        = string
  default     = "gs://cloud-training/initscripts/de-dataproc-init.sh"
}
