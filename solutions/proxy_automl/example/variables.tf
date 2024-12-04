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
  default = "ENDPOINT_ID"
}

variable "gateway_url" {
  type    = string
  default = "https://automl-gateway-kjyo252taq-uc.a.run.app/v1",
}

variable "gateway_project" {
  type    = string
  default = "qwiklabs-resources"
}
