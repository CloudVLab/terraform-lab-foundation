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

# with the same name for any lab that uses this script.
## variable "vai_username" {
##   type        = string
##   description = "Name of Qwiklabs user"
##   default     = "tester" 
## }

## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------

# Expected custom_properties key to be declared in `qwiklabs.yaml` 
# with the same name for any lab that uses this script.
variable "vai_notebook_name" {
  type        = string
  description = "Vertex VM instance name."
  default     = "cloudlearningservices" 
}

# Custom properties with defaults 
variable "vai_region" {
  type        = string 
  description = "Region to create resources in."
  default     = "us-central1" 
}

# Custom properties with defaults 
variable "vai_zone" {
  type        = string 
  description = "Zone to create resources in."
  default     = "us-central1-f" 
}

# Custom properties with defaults 
variable "vai_machine_type" {
  type        = string 
  description = "Machine type to use for GCE"
  default     = "e2-medium" 
}

# Custom properties with defaults 
variable "vai_tags" {
  type        = list(string)
  description = "GCE virtual machine tags"
  default     = ["lab-vm"]
}

# Custom properties with defaults 
variable "vai_machine_image" {
  type        = string
  description = "GCE virtual machine image"
  default     = "deeplearning-platform-release"
}

# Custom properties with defaults 
variable "vai_image_family" {
  type        = string
  description = "GCE image family"
  default     = "common-cpu-notebooks-debian-11"
}

# Custom properties with defaults 
variable "vai_machine_network" {
  type        = string
  description = "GCE virtual machine network"
  default     = "default"
}

# Custom properties with defaults 
variable "vai_post_startup_script" {
  type        = string
  description = "Path to a bash script to execute"
  default     = "gs://spls/lab-init.sh"
}

# Custom properties with defaults 
variable "vai_scopes" {
  type        = list(string)
  description = "GCE service account scope"
  default     = ["cloud-platform"]
}

# Custom properties with defaults 
variable "vai_no_public_access" {
  type        = bool 
  description = "Allow proxy access via SSH"
  default     = false 
}

# Custom properties with defaults 
variable "vai_no_proxy_access" {
  type        = bool 
  description = "Allow proxy access via SSH"
  default     = false 
}

