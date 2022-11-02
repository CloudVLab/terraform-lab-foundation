# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application
#

resource "google_app_engine_application" "app" {
  project       = var.gcp_project_id
  location_id   = var.gcp_db_location 
  database_type = var.gcp_db_type 
}

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_document#fields
#
resource "google_firestore_document" "most_played_rock" {
  project     = var.gcp_project_id
  collection  = var.collection_id_mp
  document_id = var.document_id_rock
  fields      = jsonencode(var.most_played_rock)

  depends_on = [ google_app_engine_application.app ]
}

resource "google_firestore_document" "most_played_classical" {
  project     = var.gcp_project_id
  collection  = var.collection_id_mp
  document_id = var.document_id_classical
  fields      = jsonencode(var.most_played_classical)

  depends_on = [ google_app_engine_application.app ]
}

resource "google_firestore_document" "accounts_zero" {
  project     = var.gcp_project_id
  collection  = var.collection_id_accounts
  document_id = var.document_id_zero
  fields      = jsonencode(var.accounts_zero)

  depends_on = [ google_app_engine_application.app ]
}

resource "google_firestore_document" "accounts_first" {
  project     = var.gcp_project_id
  collection  = var.collection_id_accounts
  document_id = var.document_id_first
  fields      = jsonencode(var.accounts_first)

  depends_on = [ google_app_engine_application.app ]
}

resource "google_firestore_document" "accounts_second" {
  project     = var.gcp_project_id
  collection  = var.collection_id_accounts
  document_id = var.document_id_second
  fields      = jsonencode(var.accounts_second)

  depends_on = [ google_app_engine_application.app ]
}


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
  name   = "cloudio.zip"
  bucket = google_storage_bucket.bucket.name
  source = "./cloudio/cloudio.zip"
}

#
## Cloud Functions 
#-----------------------------------------------------------------------------
#
## NEW Module: Cloud Function

resource "google_cloudfunctions_function" "cloudio_function" {
  name        = "cloudioMostPlayed"
  project     = var.gcp_project_id
  region      = var.gcp_region
  description = "Example Firestore Cloud Function"
  runtime     = var.gcf_runtime

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  entry_point           = "mostPlayed"

  environment_variables = {
    PROJECT_ID= var.gcp_project_id
  }
}

#
## IAM Cloud Functions
#-----------------------------------------------------------------------------
#
## CALL IAM to apply role to member

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = var.gcp_project_id
  region         = var.gcp_region
  cloud_function = google_cloudfunctions_function.cloudio_function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
