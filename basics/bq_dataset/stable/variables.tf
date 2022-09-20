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

variable "bq_dataset_id" {
  type        = string
  description = "Name of the dataset."
  default     = "tdataset"
}

variable "bq_dataset_friendly_name" {
  type        = string
  description = "Friendly Name of the dataset."
  default     = "tdataset"
}

variable "bq_dataset_description" {
  type        = string
  description = "Description of the dataset."
  default     = "tdataset for lab environment"
}

variable "bq_location" {
  type        = string
  description = "Region to create resources in."
  default     = "US"
}


variable "bq_table_expiration" {
  type          = number
  description   = "Table expiration set to default"
  default       = 3600000
}
