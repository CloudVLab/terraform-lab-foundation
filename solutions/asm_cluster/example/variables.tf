#
# ------------------  Qwiklabs Values
#
variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "gcp_zone" {
  type = string
}

## ---------------------------------------------------------------------------
## Custom properties
## service_account_key_file - Platform SA
## gke_cluster_name - Name of ASM cluster
## ---------------------------------------------------------------------------

variable "gcp_username" {
  type        = string
  description = "Student account"
}

variable "service_account_key_file" {
  type        = string
  description = "key file location"
}

variable "gke_cluster_name" {
  type        = string
  description = "cluster name for GKE"
  default     = "asm-cluster"
}
