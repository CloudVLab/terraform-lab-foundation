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
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------
# Custom properties with defaults 
variable "vpcNetworkName" {
  type        = string
  description = "Custom network"
  default     = "dev-network"
}

# Custom properties with defaults 
variable "vpcSubnetName" {
  type        = string
  description = "Custom network"
  default     = "dev-subnetwork"
}

# Custom properties with defaults 
variable "vpcConnectorMachineType" {
  type        = string 
  description = "VPC Access Connector Machine Type"
  # Note: valid options: f1-micro, e2-micro, e2-standard-4
  default     = "e2-micro" 
}

variable "gcrIDEService" {
  type        = string
  description = "Name of the proxy service"
  default     = "ide-service"
}

variable "gcrContainerImage" {
  type        = string
  description = "Name of the container"
  default     = "gcr.io/qwiklabs-resources/ide-proxy:latest"
}

variable "gcrRegion" {
  type        = string
  description = "GCE virtual machine image family"
  default     = "us-central1"
}
