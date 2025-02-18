#
## Cloud Storage 
#-----------------------------------------------------------------------------
#
### CALL: Cloud Storage Module

resource "google_storage_bucket" "bucket" {
  name                        = "${var.gcp_project_id}-${var.gcs_bucket_extension}"
  location                    = var.gcp_region
  project                     = var.gcp_project_id
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "archive" {
  name   = var.gcf_archive_object
  bucket = google_storage_bucket.bucket.name
  source = var.gcf_archive_source

  depends_on = [google_storage_bucket.bucket]
}

#
## Cloud Functions Gen 2
#-----------------------------------------------------------------------------

resource "google_cloudfunctions2_function" "custom_function" {
  name        = var.gcf_name
  project     = var.gcp_project_id
  location    = var.gcp_region
  description = var.gcf_description

  build_config {
    runtime               = var.gcf_runtime
    entry_point           = var.gcf_entry_point
    environment_variables = var.gcf_environment_variables
    source {
      storage_source {
        bucket = google_storage_bucket.bucket.name
        object = google_storage_bucket_object.archive.name
      }
    }
  }

  service_config {
    max_instance_count = 1
    available_memory   = "256M"
    timeout_seconds    = 60
  }

  depends_on = [google_storage_bucket_object.archive]
}

#
## IAM Cloud Functions
#-----------------------------------------------------------------------------
#
## CALL IAM to apply role to member
## CALL: IAM Module 

# IAM entry for all users to invoke the function
## resource "google_cloudfunctions2_function_iam_member" "invoker" {
##   project        = var.gcp_project_id
##   location       = var.gcp_region
##   cloud_function = google_cloudfunctions2_function.custom_function.name
##   role           = var.gcf_role_bind 
##   member         = var.gcf_member_account 
## }

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  project  = var.gcp_project_id
  location = var.gcp_region
  service  = google_cloudfunctions2_function.custom_function.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
