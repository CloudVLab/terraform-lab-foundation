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
variable "fwr_name" {
  type        = string
  description = "Name of rule."
  default     = "allow-ssh-network" 
}

# Default value passed in
variable "fwr_network" {
  type        = string
  description = "Custom VPC network."
  default     = "default" 
}

# Default value passed in
variable "fwr_source_range" {
  type        = list 
  description = "Network range."
  default     = [ "0.0.0.0/0" ] 
}

# Default value passed in
variable "fwr_direction" {
  type        = string
  description = "Direction of traffic."
  default     = "INGRESS" 
}

# Default value passed in
variable "fwr_protocol" {
  type        = string
  description = "Traffic protocol."
  default     = "tcp" 
}

# Default value passed in
variable "fwr_ports" {
  type        = list
  description = "Traffic protocol."
  default     = [ "22" ] 
}
