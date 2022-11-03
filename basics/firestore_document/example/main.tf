# Cloud Firestore: Document 
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Module: Cloud Firestore Document
module "la_firestore_document" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/firestore_document/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the Firestore Document
  gfd_collection_id = "mycollection" 
  gfd_document_id   = "mydocument" 
  gfd_document_data = { default= {"field_1"= {"stringValue"="Test"}} } 
}
