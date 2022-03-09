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

variable "gcrRegion" {
  type        = string
  description = "GCE virtual machine image family"
  default     = "us-central1"
}

variable "gceMachineImage" {
  type        = string
  description = "GCE virtual machine image family"
#  default     = "ide-codeserver"
  default     = "debian-cloud/debian-10"
}

variable "gceProjectMachineImage" {
  type        = string
  description = "Project hosting the image family"
  default     = "qwiklabs-resources"
}

variable "gceInstanceName" {
  type        = string
  description = "GCE virtual machine image family"
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

## GKE Settings
#

variable "gkeDescription" {
  type        = string 
  description = "Description to apply to the cluster."
  default     = "Lab cluster - using default description" 
}

variable "gkeIsPrivateCluster" {
  type        = bool
  description = "Set as True to spin up a private, secure cluster. False to spin up a public cluster."
  default     = true
}

variable "gkeIsPrivateEndpoint" {
  type        = bool
  description = "Set as True use the cluster private endpoint and disable public endpoint. False means cluster cluster/public endpoint can be used."
  default     = false 
}

variable "gkeIsCustomNetwork" {
  type        = bool
  description = "Set as True to utilize custom network resources. False to switch to default network."
  default     = true
}

variable "gkeNetworkingMode" {
  type        = bool 
  description = "Set to true for VPC_NATIVE (IP aliasing), false for ROUTES (default)"
  default     = "false" 
}

variable "gkeIsAutopilot" {
  type        = bool
  description = "Set as True to utilize custom network resources. False to switch to default network."
  default     = true
}

variable "gkeIsBinAuth" {
  type        = bool 
  description = "Set as True to enable Binary Authorization" 
  default     = false 
}

variable "gkeInitialNodeCount" {
  type        = string 
  description = "Set the initial number of nodes" 
  default     = "1"
}

# Custom properties with defaults 
variable "gkeClusterName" {
  type        = string
  description = "GKE Cluster name."
  default     = "dev-cluster" 
}

# Custom properties with defaults 
variable "gkeMasterIPv4CIDRBlock" {
  type        = string
  description = "GKE Master CIDR block"
  default     = "172.16.0.0/28"
}

# Custom properties with defaults 
variable "gkeMasterIPv4CIDRBlock2" {
  type        = string
  description = "GKE Master CIDR block"
  default     = "172.16.1.0/28"
}

# Custom properties with defaults 
variable "gkeMasterIPv4CIDRBlock3" {
  type        = string
  description = "GKE Master CIDR block"
  default     = "172.16.2.0/28"
}

# Custom properties with defaults 
variable "gkeModeVpcNative" {
  type        = string
  description = "Networking mode - VPC Native"
  default     = "VPC_NATIVE"
}

# Custom properties with defaults 
variable "gkeModeRoutes" {
  type        = string
  description = "Networking mode - Routes"
  default     = "ROUTES"
}
