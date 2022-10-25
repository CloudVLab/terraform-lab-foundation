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


## --------------------------------------------------------------
## Custom variable definitions
## --------------------------------------------------------------

# Default value passed in
variable "vpc_network" {
  type        = string
  description = "Name of the VPC network to create."
  default     = "dev_network" 
}

# Default value passed in
variable "vpc_network_description" {
  type        = string
  description = "Custom VPC network."
  default     = "Qwiklabs lab network" 
}

# Default value passed in
variable "vpc_subnet" {
  type        = string
  description = "Name of the VPC subnetwork to create."
  default     = "dev_subnet" 
}

# Default value passed in
variable "vpc_region" {
  type        = string
  description = "Name of the VPC subnetwork to create."
  default     = "us-central1" 
}

# Default value passed in
variable "vpc_subnet_cidr" {
  type        = string
  description = "VPC subnetwork to cidr."
  default     = "10.128.0.0/16" 
}
