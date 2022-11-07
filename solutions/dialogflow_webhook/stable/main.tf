#
# ------------------ Module Definition 
#

# Solution: Dialogflow Webhook 
# Local:  solutions/dialogflow_webhook/stable
# Remote: github//solutions/dialogflow_webhook/stable

#
## Cloud Firestore 
##------------------------------------------------------------
#

# App Engine:    App Engine + Cloud Database
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: App Engine + Cloud Firestore
module "la_gae" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/app_engine/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GAE instance
  gae_location    = "us-central" 
  gae_hasDatabase = true 
  gae_db_type     = "CLOUD_FIRESTORE"
}

#
## Most Played Collection
##------------------------------------------------------------
#

# Cloud Firestore: Document 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Cloud Firestore Document
module "la_firestore_pop" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Firestore Document
  gfd_collection_id = var.collection_most_played 
  gfd_document_id   = var.document_pop 
  gfd_document_data = var.mp_data_pop

  # Provision the Cloud Firestore
  depends_on = [module.la_gae ]
}

module "la_firestore_rock" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Firestore Document
  gfd_collection_id = var.collection_most_played 
  gfd_document_id   = var.document_rock 
  gfd_document_data = var.mp_data_rock

  # Provision the Cloud Firestore
  depends_on = [module.la_firestore_pop]
}

module "la_firestore_classical" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Firestore Document
  gfd_collection_id = var.collection_most_played 
  gfd_document_id   = var.document_classical
  gfd_document_data = var.mp_data_classical

  # Provision the Cloud Firestore
  depends_on = [module.la_firestore_rock]
}

#
## Accounts Collection
##------------------------------------------------------------
#
module "la_firestore_415" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Firestore Document
  gfd_collection_id = var.collection_accounts 
  gfd_document_id   = var.document_415 
  gfd_document_data = var.ac_data_415

  # Provision the Cloud Firestore
  depends_on = [module.la_gae ]
}

module "la_firestore_925" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Firestore Document
  gfd_collection_id = var.collection_accounts 
  gfd_document_id   = var.document_925 
  gfd_document_data = var.ac_data_925

  # Provision the Cloud Firestore
  depends_on = [module.la_firestore_415]
}

module "la_firestore_650" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Firestore Document
  gfd_collection_id = var.collection_accounts 
  gfd_document_id   = var.document_650 
  gfd_document_data = var.ac_data_650

  # Provision the Cloud Firestore
  depends_on = [module.la_firestore_925 ]
}

#
## Cloud Function
##------------------------------------------------------------
#

# Module: Cloud Functions
module "la_gcf_mp" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_function/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Cloud Storage
  gcs_bucket_extension = "mp"

  # Customise the Cloud Function
  gcf_name             = "cloudioGetMostPlayed"
  gcf_entry_point      = "mostPlayed"
  gcf_description      = "Most Played Cloud Function"
  gcf_runtime          = "nodejs16"
  gcf_archive_object   = "mostplayed.zip"
  gcf_archive_source   = "./cf/mostplayed.zip"
}

# Module: Cloud Functions
module "la_gcf_ac" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_function/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Cloud Storage
  gcs_bucket_extension = "ac"

  # Customise the Cloud Function
  gcf_name             = "cloudioAccountUpdate"
  gcf_entry_point      = "accountUpdate"
  gcf_description      = "Accounts Cloud Function"
  gcf_runtime          = "nodejs16"
  gcf_archive_object   = "account.zip"
  gcf_archive_source   = "./cf/account.zip"
}
