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
## Optional variable definitions
## --------------------------------------------------------------

variable "sql_user_name" {
  type        = string
  description = "Name of Cloud SQL user"
  default     = "appsheet-user"
}

variable "sql_db_name" {
  type        = string
  description = "Name of Cloud SQL instance"
  default     = "mysql"
}

variable "sql_db_version" {
  type        = string
  description = "Version of Cloud SQL instance"
  default     = "MYSQL_5_7"
}

variable "sql_user_host" {
  type        = string
  description = "Cloud SQL host access"
  default     = "%"
}

variable "sql_user_password" {
  type        = string
  description = "Cloud SQL instance user password"
  default     = "Password01" 
}
