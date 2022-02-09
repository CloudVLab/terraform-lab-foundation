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

# QWIKLAB.YAML definitions
# variable: qlUsername 
variable "qlUsername" {
  type = string
}

#
# ------------------  Custom Properties
#

# variable: qlResourceName 
variable "qlResourceName" {
  type = string
}

# variable: qlMachineImage
variable "qlMachineImage" {
  type = string
}


