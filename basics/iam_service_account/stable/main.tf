# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
#

resource "google_service_account" "custom_sa" {
  account_id   = var.iam_sa_name 
  description  = var.iam_sa_description 
  display_name = var.iam_sa_display 
}

## variable "sa_members" {
##   type = list(string)
##   default = ["user1@example.com", "user2@example.com", "user3@example.com"]
## }
## 
## variable "sa_roles" {
##   type = list(string)
##   default = ["roles/viewer", "roles/editor", "roles/owner"]
## }

## resource "google_project_iam_member" "tlf" {
##   for_each = {
##     for idx, role in var.sa_roles: idx => {
##       member = var.sa_member
##       role   = role 
##     }
##   }
## 
##   project = var.gcp_project_id 
##   member  = var.sa_member
##   role    = each.value.role
## }
## 
