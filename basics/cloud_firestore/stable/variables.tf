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


## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------

# Custom properties with defaults
variable "gae_location" {
  type        = string
  description = "Location of App Engine to create resources in."
  default     = "us-central"
}

variable "gae_hasDatabase" {
  type        = bool 
  description = "App Engine created with a Database."
  default     = false 
}

variable "gae_db_type" {
  type        = string
  description = "The type of database i.e. CLOUD_FIRESTORE | CLOUD_DATASTORE_COMPATIBILITY" 
  default     = "CLOUD_FIRESTORE"
}
