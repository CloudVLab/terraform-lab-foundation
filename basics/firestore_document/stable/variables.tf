## --------------------------------------------------------------
## Mandatory variable definitions
## --------------------------------------------------------------

variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to create resources in."
}

# Default value passed in
variable "gcp_region" {
  type        = string
  description = "Region to create resources in."
}

# Default value passed in
variable "gcp_zone" {
  type        = string
  description = "Zone to create resources in."
}

## --------------------------------------------------------------
## Output variable definitions - Override from Custom Properties 
## --------------------------------------------------------------


## --------------------------------------------------------------
## Custom variable definitions - Override from Custom Properties
## --------------------------------------------------------------

variable "gfd_collection_id" {
  type        = string
  description = "Name of the Firestore Collection"
  default     = "collection_test"
}

variable "gfd_document_id" {
  type        = string
  description = "Name of the Firestore Document"
  default     = "document_test"
}

variable "gfd_document_data" {
  default = {
    "field_1"= {
       "stringValue"= "Test Data"
    },
    "field_2"= {
       "stringValue"= "Test Data"
    }
  }
}
