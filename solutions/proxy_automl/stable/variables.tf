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
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------


## --------------------------------------------------------------
## AutoML Proxy - Cloud Run Service  
## Default: Use Environment Variables
## --------------------------------------------------------------


# Endpoint Id value
## variable "sm_endpoint" {
##   type        = string
##   description = "endpoint identifier to be used."
##   default     = "undefined"
## }
## 
## # Gateway Host value
## variable "sm_gatewayhost" {
##   type        = string
##   description = "Gateway host project identifier to be used."
##   default     = "undefined"
## }
## 
## # Gateway Url value 
## variable "sm_gatewayurl" {
##   type        = string
##   description = "project identifier to be used."
##   default     = "undefined"
## }
## 

## --------------------------------------------------------------
## AutoML Proxy - Cloud Run Service  
## Default: Use Environment Variables
## --------------------------------------------------------------

# Proxy service name
variable "cr_service_name" {
  type        = string
  description = "Name of the proxy service to be created"
  default     = "automl-proxy"
}

# Proxy service image  
variable "cr_image" {
  type        = string
  description = "Image for the proxy service"
  default     = "gcr.io/qwiklabs-resources/automl-proxy:latest"
}

# Proxy service image  
variable "cr_region" {
  type        = string
  description = "Region for the Cloud Run service"
  default     = "us-central1"
}

# Default environment variables 
variable "cr_env" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = []
  type = list(object({
    gcr_env_name  = string,
    gcr_env_value = string
  }))
}

