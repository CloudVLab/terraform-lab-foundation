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
  default     = "us-east1-b"
}

## --------------------------------------------------------------
## Output variable definitions - Override from Custom Properties 
## --------------------------------------------------------------

# with the same name for any lab that uses this script.
# Expected custom_properties key to be declared in `qwiklabs.yaml` 
# with the same name for any lab that uses this script.
variable "apigee_name" {
  type        = string
  description = "Apigee Network Name."
  default     = "apigee-network"
}

variable "region_name" {
  type        = string
  description = "Apigee Region Name."
  default     = "us-central1"
}


## --------------------------------------------------------------
## Custom Key-Value params. with defaults
## --------------------------------------------------------------
# Custom properties with defaults

variable "parentProject" {
  type    = string
  default = "qwiklabs-resources"
}

variable "parentProjectSvcAccountPass" {
  type    = string
  default = "SuperSecret123!"
}

variable "parentProjectStorageBucket" {
  type    = string
  default = "apigeexlabs"
}

variable "parentProjectDNSZone" {
  type    = string
  default = "apigee-dns"
}

variable "parentProjectSourceRepo" {
  type    = string
  default = "apigeexlabs"
}

variable "parentProjectSourceBranch" {
  type    = string
  default = "cloudlearning"
}

variable "parentProjectLabDirName" {
  type    = string
  default = "apigeex-cloudlearning"
}

variable "parentProjectLabType" {
  type    = string
  default = "CloudLearning"
}

variable "createProdEnvironment" {
  type    = string
  default = "no"
}

variable "childProjectZone" {
  type    = string
  default = "us-east1-b"
}

variable "childProjectRegion" {
  type    = string
  default = "us-east1"
}

variable "startup_script_url" {
  type    = string
  default = "gs://apigeexlabs/resources/bootstrap-cloudlearning.sh"
}