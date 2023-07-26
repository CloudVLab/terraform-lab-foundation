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
## Ensure these values are defined in Qwiklabs.yaml
# with the same name for any lab that uses this script.
variable "gcp_username" {
  type        = string
  description = "Name of Qwiklabs user"
  default     = "tester"
}

## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------

variable "vpcConnectorMachineType" {
  type        = string
  description = "VPC Access Connector Machine Type"
  # Note: valid options: e2-micro, e2-standard-4
  default     = "e2-micro"
}

# Custom properties with defaults 
variable "gcrRegion" {
  type        = string 
  description = "Region to create resources in."
  default     = "us-central1" 
}

# Custom properties with defaults 
variable "gcrImageIde" {
  type        = string 
  description = "Image to be run by Cloud Run"
  default     = "gcr.io/qwiklabs-resources/ide-proxy:latest" 
}

# Custom properties with defaults 
variable "gcrImageBrowser" {
  type        = string 
  description = "Image to be run by Cloud Run"
  default     = "gcr.io/qwiklabs-resources/certdoc-proxy:latest" 
}

# Custom properties with defaults 
variable "gceInstanceName" {
  type        = string 
  description = "Name of virtual machine."
  default     = "cloudlearningservices" 
}

# Custom properties with defaults 
variable "gceInstanceZone" {
  type        = string 
  description = "Zone to create resources in."
  default     = "us-central1-f" 
}

# Custom properties with defaults 
variable "gceInstanceTags" {
  type        = list(string)
  description = "GCE virtual machine tags"
  default     = ["lab-vm"]
}

variable "gceMachineImage" {
  type        = string
  description = "GCE virtual machine image family"
  default     = "cloudshell-codeserver"
}

# Custom properties with defaults 
variable "gceMachineType" {
  type        = string 
  description = "Machine type to use for GCE"
  default     = "e2-standard-2" 
}

# Custom properties with defaults 
variable "gceInstanceNetwork" {
  type        = string
  description = "GCE virtual machine network"
  default     = "default"
}

# Custom properties with defaults 
variable "gceInstanceScope" {
  type        = list(string)
  description = "GCE service account scope"
  default     = ["cloud-platform"]
}

# Custom properties with defaults
variable "gce_startup_script" {
  type        = string
  description = "GCE startup script"
  default     = "echo Welcome to Project Octopus > /tmp/octopus.txt"
}
