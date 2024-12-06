#
# ------------------  Qwiklabs Values
#
variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "gcp_zone" {
  type = string
}


#
# ------------------  Custom Properties
#

variable "endpoint_id" {
  type    = string
}

variable "gateway_url" {
  type    = string
}

variable "gateway_project" {
  type    = string
}
