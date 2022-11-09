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

# with the same name for any lab that uses this script.
variable "iam_sa" {
  type        = string
  description = "display name"
}
