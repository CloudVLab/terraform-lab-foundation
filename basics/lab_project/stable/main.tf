# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project
#
data "google_project" "project" {
  project_id = var.gcp_project_id
}

