# Qwiklabs Mandatory Values
variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "gcp_zone" {
  type = string
}

## --------------------------------------------------------------
## Variable definitions - Override from Custom Properties 
## --------------------------------------------------------------

variable "gcp_allowed_regions" {
  type = list(string) 
  description = "List of Regions to be used"
  default = [ "us-central1", "us-east1", "us-east4", "us-west1" ]
}
