# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
#
# TODO: Move to building block
resource "google_storage_bucket" "cloud-bucket" {
  name          = "${var.gcp_project_id}-${var.gcs_bucket_extension}" 
  location      = "US"
  force_destroy = true

  project       = var.gcp_project_id 
  uniform_bucket_level_access = true
}
