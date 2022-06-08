# Qwiklabs Mandatory: PROJECT_ID
variable "gcp_project_id" {
  type = string
}

# Qwiklabs Mandatory: REGION
variable "gcp_region" {
  type = string
}

# Qwiklabs Mandatory: ZONE
variable "gcp_zone" {
  type = string
}

## --------------------------------------------------------------
## Custom variable definitions 
## --------------------------------------------------------------

# Expected custom_properties key to be declared in `qwiklabs.yaml` 
# with the same name for any lab that uses this script.
variable "secret_manager_label" {
  type        = string
  description = "Label to be applied to the Secret."
  default     = "lab"
}

variable "secret_manager_identifier" {
  type        = string
  description = "Unique secret payload identifier."
  default     = "lab-secret"
}

variable "secret_manager_data" {
  type        = string
  description = "Label to be applied to the Secret."
  default     = "lab-data"
}
