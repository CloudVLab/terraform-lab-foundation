# versions.tf
terraform {
  required_providers {
    google = {
      # https://registry.terraform.io/providers/hashicorp/google/latest
      version = "5.6.0"
    }
    google-beta = {
      # https://registry.terraform.io/providers/hashicorp/google-beta/latest
      version = "5.6.0"
    }
  }
}
