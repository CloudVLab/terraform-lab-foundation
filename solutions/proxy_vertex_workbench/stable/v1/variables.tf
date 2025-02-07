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

variable "vpcConnectorMachineType" {
  type        = string
  description = "VPC Access Connector Machine Type"
  # Note: valid options: f1-micro, e2-micro, e2-standard-4
  default = "e2-micro"
}

# Custom properties with defaults 
variable "gcrServiceName" {
  type        = string
  description = "Name of the Cloud Run."
  default     = "workbench-service"
}

# Custom properties with defaults 
variable "gcrRegion" {
  type        = string
  description = "Region to create resources in."
  default     = "us-central1"
}

# Custom properties with defaults 
variable "gcrImagePrimary" {
  type        = string
  description = "Image to be run by Cloud Run"
  default     = "gcr.io/qwiklabs-resources/notebook-proxy:latest"
}

# Custom properties with defaults 
variable "gcrGoogleService" {
  type        = string
  description = "Google APIs Cloud Run Service."
  default     = "run.googleapis.com"
}

# Custom properties with defaults 
variable "gcrRolePermission" {
  type        = string
  description = "Assign role IAM permissions"
  default     = "roles/run.invoker"
}

# Custom properties with defaults 
variable "gcrMemberPermission" {
  type        = string
  description = "Assign member IAM permissions"
  default     = "allUsers"
}

# Custom properties with defaults 
variable "gceInstanceName" {
  type        = string
  description = "Name of virtual machine."
  default     = "cls-vertex-workbench"
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
  default     = [ "cls", "lab-vm", "http-server", "https-server" ]
}

variable "gceImageProject" {
  type        = string
  description = "Project owner for Vertex image"
  default     = "deeplearning-platform-release"
}

variable "gceInstanceImage" {
  type        = string
  description = "GCE Image family"
  default     = "common-cpu-notebooks-debian-11"
}

# Custom properties with defaults 
variable "gceMachineType" {
  type        = string
  description = "Machine type to use for GCE"
  default     = "e2-medium"
}

# Custom properties with defaults 
variable "gceInstanceNetwork" {
  type        = string
  description = "GCE virtual machine network"
  default     = "default"
}

# Custom properties with defaults 
variable "gceDisableExternalIp" {
  type        = bool 
  description = "GCE disable external IP"
  default     = true 
}

# Custom properties with defaults 
variable "gceInstanceScope" {
  type        = list(string)
  description = "GCE service account scope"
  default     = ["cloud-platform"]
}

# Custom properties with defaults
variable "gcePostStartupScript" {
  type        = string
  description = "Vertex post startup-script via public URL"
  default     = "https://storage.googleapis.com/spls/tlf-workbench/proxy-lab-init.sh"
}

# Custom properties with defaults 
variable "vpcSubnetCidr" {
  type        = string
  description = "Subnetwork range"
  default     = "10.1.0.0/16"
}
