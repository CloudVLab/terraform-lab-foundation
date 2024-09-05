# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
# Authorative for a given role.
#
## resource "google_project_iam_binding" "vertex_viewer_bind" {
##   role    = "roles/viewer"
##   project = var.gcp_project_id
##   members = [
##     "serviceAccount:vertex-ai@${var.gcp_project_id}.iam.gserviceaccount.com",
##   ]
##   depends_on = [google_service_account.service_account]
## }

resource "google_project_iam_member" "vertex_viewer_bind" {
  role       = "roles/viewer"
  project    = var.gcp_project_id
  member     = "serviceAccount:vertex-ai@${var.gcp_project_id}.iam.gserviceaccount.com"
  depends_on = [google_service_account.service_account]
}


