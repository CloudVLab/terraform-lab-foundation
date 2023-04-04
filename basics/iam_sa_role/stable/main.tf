# Reference
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_member
#

resource "google_project_iam_member" "tlf" {
  for_each = {
    for idx, role in var.iam_sa_roles: idx => {
      member = var.iam_sa_name
      role   = role 
    }
  }

  project = var.gcp_project_id 
  member  = var.iam_sa_name
  role    = each.value.role
}
