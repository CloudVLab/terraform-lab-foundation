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
  default     = null
}

# Custom properties with defaults 
variable "gce_zone" {
  type        = string
  description = "Zone to create resources in."
  default     = null 
}

# Custom properties with defaults 
variable "gce_machine_type" {
  type        = string
  description = "Machine type to use for GCE"
  default     = "e2-standard-2"
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
  default     = "debian-cloud/debian-11"
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

# Custom properties with defaults 
## The default setting uses compute developer service account
variable "gce_service_account" {
  type        = string
  description = "GCE Service Account"
  default     = "default"
}

# Custom properties with defaults 
## The default Metadata setting 
variable "gce_metadata" {
  type        = map(string)
  description = "GCE Metadata object"
  default     = { "foo" = "bar" }
}

# Custom properties with defaults 
variable "gce_startup_script" {
  type        = string
  description = "GCE startup script"
  default     = "echo Welcome to Project Octopus > /tmp/octopus.txt"
}

# Custom properties with defaults 
variable "gce_can_ip_forward" {
  type        = bool
  description = "Allow IP forwarding"
  default     = false
}

# Custom properties with defaults 
variable "gce_assign_external_ip" {
  type        = bool
  description = "Enable an external IP"
  default     = true
}
