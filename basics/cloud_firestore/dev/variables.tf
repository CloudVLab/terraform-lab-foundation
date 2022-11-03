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

# Custom properties with defaults
variable "gcp_ae_location" {
  type        = string
  description = "Location of App Engine to create resources in."
  default     = "us-central"
}

variable "hasFirestoreDb" {
  type        = bool 
  description = "App Engine enable Cloud Firestore."
  default     = false 
}

variable "gcp_db_type" {
  type        = string
  description = "The type of database i.e. CLOUD_FIRESTORE | CLOUD_DATASTORE_COMPATIBILITY" 
  default     = "CLOUD_FIRESTORE"
}

## variable "most_played_rock" {
##   default = {
##     "composer"= {
##        "stringValue"= "Led Zeppelin"
##     },
##     "title"= {
##        "stringValue"= "Stairway to Heaven"
##     }
##   }
## }
## 
## variable "most_played_classical" {
##   default = {
##     "composer"= {
##        "stringValue"= "Wolfgang Mozart"
##     },
##     "title"= {
##        "stringValue"= "Serenade No 13 for strings in G major"
##     }
##   }
## }
## 
## variable "accounts_zero" {
##   default = {
##     "first_name"= {
##        "stringValue"= "Nozomi"
##     },
##     "last_name"= {
##        "stringValue"= "Hernandez"
##     },
##     "pin"= {
##        "stringValue"= "1111"
##     }
##     "tier"= {
##        "stringValue"= "platinum"
##     }
##   }
## }
## 
## variable "accounts_first" {
##   default = {
##     "first_name"= {
##        "stringValue"= "Mohammed"
##     },
##     "last_name"= {
##        "stringValue"= "Devi"
##     },
##     "pin"= {
##        "stringValue"= "2222"
##     }
##     "tier"= {
##        "stringValue"= "gold"
##     }
##   }
## }
## 
## variable "accounts_second" {
##   default = {
##     "first_name"= {
##        "stringValue"= "Chitra"
##     },
##     "last_name"= {
##        "stringValue"= "Wang"
##     },
##     "pin"= {
##        "stringValue"= "3333"
##     }
##     "tier"= {
##        "stringValue"= "silver"
##     }
##   }
## }
## 
## 
## variable "collection_id_mp" {
##   type        = string
##   description = "Name of the Firestore Collection"
##   default     = "most_played"
## }
## 
## variable "collection_id_accounts" {
##   type        = string
##   description = "Name of the Firestore Collection"
##   default     = "accounts"
## }
## 
## variable "document_id_rock" {
##   type        = string
##   description = "Name of the Firestore Document"
##   default     = "rock"
## }
## 
## variable "document_id_classical" {
##   type        = string
##   description = "Name of the Firestore Document"
##   default     = "classical"
## }
## 
## variable "document_id_zero" {
##   type        = string
##   description = "Name of the Firestore Document"
##   default     = "4155551212"
## }
## 
## variable "document_id_first" {
##   type        = string
##   description = "Name of the Firestore Document"
##   default     = "9255551212"
## }
## 
## variable "document_id_second" {
##   type        = string
##   description = "Name of the Firestore Document"
##   default     = "6505551212"
## }
## 
## variable "gcs_bucket_extension" {
##   type        = string
##   description = "bucket"
##   default     = "bucket"
## }
## 
## variable "gcf_runtime" {
##   type        = string
##   description = "Runtime used for Cloud Function"
##   default     = "nodejs16"
## }
