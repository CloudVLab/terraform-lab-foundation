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
  default     = "tf-test-gce" 
}


## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------

# Custom properties with defaults 
variable "gce_region" {
  type        = string 
  description = "Region to create resources in."
  default     = "us-central1" 
}

# Custom properties with defaults 
variable "gce_zone" {
  type        = string 
  description = "Zone to create resources in."
  default     = "us-central1-f" 
}

# Custom properties with defaults 
variable "gce_machine_type" {
  type        = string 
  description = "Machine type to use for GCE"
  default     = "n1-standard-1" 
}

# Custom properties with defaults 
variable "gce_tags" {
  type        = list(string)
  description = "GCE virtual machine tags"
  default     = ["lab-vm"]
}

# Custom properties with defaults 
variable "gce_machine_image" {
  type        = string
  description = "GCE virtual machine image"
  default     = "debian-cloud/debian-10"
}

# Custom properties with defaults 
variable "gce_machine_network" {
  type        = string
  description = "GCE virtual machine network"
  default     = "default"
}

# Custom properties with defaults 
variable "gce_scopes" {
  type        = list(string)
  description = "GCE service account scope"
  default     = ["cloud-platform"]
}
