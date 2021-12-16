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

variable "tfResourceName" {
  type        = string
  description = "The name of resource to be created"
}

variable "tfUsername" {
  type        = string
  description = "The name assigned to the project"
}

