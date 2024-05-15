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
## Ensure corresponding values in Qwiklabs.yaml


## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------

# Custom properties with defaults 
variable "gcrServiceName" {
  type        = string
  description = "Name of the Cloud Run service"
  default     = "lab-service"
}

# Custom properties with defaults 
variable "gcrServiceImage" {
  type        = string
  description = "Name of the Cloud Run service"
  default     = "gcr.io/qwiklabs-resources/test-ide-proxy:latest"
}

# Custom properties with defaults 
variable "gcrServiceEgress" {
  type        = string
  description = "Egress applied to the Cloud Run service"
  default     = "ALL_TRAFFIC"
}

# Custom properties with defaults 
variable "gcrInstanceTags" {
  type        = list(any)
  description = "List of network tags"
  default     = ["lab-vm"]
}

# Custom properties with defaults 
variable "gcrNetworkName" {
  type        = string
  description = "Custom network"
  ## default     = "dev-network"
  default = "default"
}

# Custom properties with defaults 
variable "gcrSubnetName" {
  type        = string
  description = "Custom network"
  ## default     = "dev-subnetwork"
  default = "default"
}

# Custom properties with defaults 
variable "gcrServiceRole" {
  type        = string
  description = "Role permission for service access"
  default = "roles/run.invoker"
}

# Custom properties with defaults 
variable "gcrMemberAccess" {
  type        = list 
  description = "Member access to the service"
  default = [ "allUsers" ]
}
