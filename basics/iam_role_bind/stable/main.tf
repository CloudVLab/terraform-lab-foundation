# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
#
resource "google_service_account" "service_account" {
  account_id   = var.iam_sa_name 
  description  = var.iam_sa_description 
  display_name = var.iam_sa 
}

## https://www.terraform.io/language/values/locals#using-local-values
locals {
  ## Avoid repetition on expression
  service_account = "serviceAccount:${google_service_account.service_account.account_id}@${var.gcp_project_id}.iam.gserviceaccount.com"
}


## Non Authoritative Binding - Wipes existing users with this role
resource "google_project_iam_member" "sa_iam_bind" {
  role    = var.iam_role 
  project = var.gcp_project_id
  member  = local.service_account

  ## Add IAM Conditional access
##  condition {
##    title       = "expires_after_2019_12_31"
##    description = "Expiring at midnight of 2019-12-31"
##    expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
##  }

  depends_on = [google_service_account.service_account]
}


# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
## ## Authoritative Binding - Wipes existing users with this role
## resource "google_project_iam_binding" "override_iam_bind" {
##   role    = "roles/viewer"
##   project = var.gcp_project_id
##   members = [
## #    "user:${var.iam_user}",
##     "serviceAccount:${google_service_account.service_account.account_id}@${var.gcp_project_id}.iam.gserviceaccount.com",
##   ]
## 
## ## Add IAM Conditional access
## ##  condition {
## ##    title       = "expires_after_2019_12_31"
## ##    description = "Expiring at midnight of 2019-12-31"
## ##    expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
## ##  }
## 
##   depends_on = [google_service_account.service_account]
## }
