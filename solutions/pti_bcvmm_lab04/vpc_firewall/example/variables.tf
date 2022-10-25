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
variable "fwr_network" {
  type        = string
  description = "Custom VPC network."
  default     = "default" 
}

variable "fwr_rules" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = []
  type = list(object({
    fwr_name                    = string
    fwr_description             = string
    fwr_direction               = string
    fwr_priority                = number
    fwr_source_ranges                  = list(string)
    fwr_source_tags             = list(string)
    fwr_source_service_accounts = list(string)
    fwr_target_tags             = list(string)
    fwr_target_service_accounts = list(string)
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))
    deny = list(object({
      protocol = string
      ports    = list(string)
    }))
    log_config = object({
      metadata = string
    })
  }))
}
