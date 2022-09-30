# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
#
# TODO: Move to building block
resource "google_storage_bucket" "cloud-bucket" {
  name                        = var.gcs_append_project ? "${var.gcp_project_id}-${var.gcs_bucket_extension}" : "${var.gcs_bucket_extension}"
  location                    = var.gcp_region 
  project                     = var.gcp_project_id
  storage_class               = var.gcs_storage_class
  force_destroy               = true
  uniform_bucket_level_access = true
}
