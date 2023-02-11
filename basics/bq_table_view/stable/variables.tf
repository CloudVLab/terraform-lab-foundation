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

variable "bq_table_id" {
  type        = string
  description = "Name of the table."
  default     = "ttable"
}

variable "bq_table_description" {
  type        = string
  description = "Description of the dataset."
  default     = "tdataset for lab environment"
}

variable "bq_dataset_id" {
  type        = string
  description = "The name of the dataset"
  default     = ""
}

variable "bq_view_query" {
  type        = string
  description = "Query to create a view."
  default     = ""
}

variable "bq_view_legacy_sql" {
  type        = bool 
  description = "Set to true to use legacy SQL"
  default     = true 
}
