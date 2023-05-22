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

variable "gcp_username" {
  type        = string
  description = "The lab username"
}

variable "service_account_key_file" {
  type = string
  description = "key file location"
}

variable "gke_cluster_name" {
  type = string
  description = "cluster name for GKE"
}
