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
variable "sva_name" {
  type        = string
  description = "Name of the VPC connector."
  default     = "ideconn" 
}

# Default value passed in
variable "sva_network" {
  type        = string
  description = "Name of the VPC network to use."
  default     = "default" 
}

# Default value passed in
variable "sva_subnet_cidr" {
  type        = string
  description = "VPC subnetwork to cidr."
  default     = "10.8.0.0/28" 
}

# Default value passed in
variable "sva_connector_machine_type" {
  type        = string
  description = "VPC connector machine default."
  default     = "e2-micro" 
}
