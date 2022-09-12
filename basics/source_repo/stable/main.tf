# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sourcerepo_repository
# GSR:   Create a Source Repository 
resource "google_sourcerepo_repository" "lab-repo" {
  name    = var.gsr_name 
  project = var.gcp_project_id
}
