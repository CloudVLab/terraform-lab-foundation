# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
#
resource "google_service_account" "service_account" {
  account_id   = "billing-qwiklabs"
  display_name = "Billing Service Account"
}

resource "google_service_account" "tester_account" {
  account_id   = "billing-test"
  display_name = "Test Billing Service Account"
}


# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
## Authoritative Binding - Wipes existing users with this role
resource "google_project_iam_binding" "iam_role_override" {
  role    = "roles/billing.user"
  project = var.gcp_project_id
  members = [
    "user:${var.iam_user}",
#    "serviceAccount:${google_service_account.service_account.account_id}@${var.gcp_project_id}.iam.gserviceaccount.com",
#    "serviceAccount:${google_service_account.tester_account.account_id}@${var.gcp_project_id}.iam.gserviceaccount.com",
  ]

## Add IAM Conditional access
##  condition {
##    title       = "expires_after_2019_12_31"
##    description = "Expiring at midnight of 2019-12-31"
##    expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
##  }

  depends_on = [google_service_account.service_account]
}

## Non Authoritative Binding - Wipes existing users with this role
## resource "google_project_iam_member" "iam_role_new" {
##   role    = "roles/viewer"
##   project = var.gcp_project_id
##   member  = "serviceAccount:${google_service_account.service_account.account_id}@${var.gcp_project_id}.iam.gserviceaccount.com"
##   member  = "user:${var.iam_user}"
##   
## Add IAM Conditional access
##   condition {
##     title       = "expires_after_2019_12_31"
##     description = "Expiring at midnight of 2019-12-31"
##     expression  = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
##   }
##
##   depends_on = [google_service_account.service_account]
## }
