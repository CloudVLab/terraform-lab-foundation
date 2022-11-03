# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_document#fields
#
resource "google_firestore_document" "template" {
  project     = var.gcp_project_id
  collection  = var.gfd_collection_id
  document_id = var.gfd_document_id
  fields      = jsonencode(var.gfd_document_data)
}
