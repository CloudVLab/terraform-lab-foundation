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

# QWIKLAB.YAML definitions
# Example: Pass Variable from qwiklabs.yaml

# variable: tfUsername 
## variable "tfUsername" {
##   type = string
## }
## 
## # variable: tfResorceName 
## variable "tfResourceName" {
##   type = string
## }
## 
## # variable: tfMachineImage 
## variable "tfMachineImage" {
##   type = string
## }


