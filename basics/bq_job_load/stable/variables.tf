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

variable "bq_job_id" {
  type        = string
  description = "Name of the table."
  default     = "job1"
}

# Default value passed in
variable "bq_location" {
  type        = string
  description = "Region to create resources in."
  default     = "US"
}

variable "bq_job_label" {
  type        = map 
  description = "Label for the job to be performed."
  default     = { "my_job" = "BQ Job Load for the lab" }
}

variable "bq_job_source" {
  type        = list 
  description = "Name of the table."
  default     = [ "gs://spls/test.csv" ]
}

variable "bq_dataset_id" {
  type        = string
  description = "The name of the dataset"
  default     = ""
}

variable "bq_table_id" {
  type        = string
  description = "Name of the table."
  default     = "ttable"
}

variable "bq_job_skip_row" {
  type        = number 
  description = "Source formate"
  default     = 0 
}

variable "bq_job_write" {
  type        = string
  description = "Write disposition"
  default     = "WRITE_APPEND"
}

variable "bq_job_format" {
  type        = string
  description = "Source formate"
  default     = "CSV"
}

variable "bq_job_autodetect" {
  type        = bool 
  description = "Auto detect format"
  default     = true 
}
