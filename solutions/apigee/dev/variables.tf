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
  default     = "us-east1"

}

# Default value passed in
variable "gcp_zone" {
  type        = string
  description = "Zone to create resources in."
  default     = "us-east1-b"
}

#variable "gcp_project_number" {
#  type        = number
#  description = "GCP Project number applied at lab run."
#}

## --------------------------------------------------------------
## Output variable definitions - Override from Custom Properties 
## --------------------------------------------------------------

# with the same name for any lab that uses this script.
variable "gcp_username" {
  type        = string
  description = "Name of Qwiklabs user"
  default     = "qwiklabs-student"
}

# Expected custom_properties key to be declared in `qwiklabs.yaml` 
# with the same name for any lab that uses this script.
variable "gce_name" {
  type        = string
  description = "GCE VM instance name."
  default     = "lab-startup"
}


## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------

# Custom properties with defaults 
variable "gce_region" {
  type        = string
  description = "Region to create resources in."
  default     = "us-east1"
}

# Custom properties with defaults 
variable "gce_zone" {
  type        = string
  description = "Zone to create resources in."
  default     = "us-east1-b"
}

# Custom properties with defaults 
variable "gce_machine_type" {
  type        = string
  description = "Machine type to use for GCE"
  default     = "n1-standard-4"
}

# Custom properties with defaults 

# Custom properties with defaults 
variable "gce_machine_image" {
  type        = string
  description = "GCE virtual machine image"
  default     = "ubuntu-os-cloud/ubuntu-1804-lts"
}

# Custom properties with defaults 
variable "gce_machine_network" {
  type        = string
  description = "GCE virtual machine network"
  default     = "default"
}

# Custom properties with defaults 
# variable "gce_scopes" {
#   type        = list(string)
#   description = "GCE service account scope"
#   default     = ["cloud-platform"]
# }

# Custom properties with defaults 
## The default setting uses compute developer service account
# Custom properties with defaults 
variable "gce_can_ip_forward" {
  type        = bool
  description = "Allow IP forwarding"
  default     = "false"
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

variable "childProjectSvcAccountJSON" {
  type    = string
  default = "default"
}