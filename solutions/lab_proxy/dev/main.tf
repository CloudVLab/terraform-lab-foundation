## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector
## 
## # Enable the vpc access service
## resource "google_project_service" "vpcaccess-api" {
##   project = var.gcp_project_id
##   service = "vpcaccess.googleapis.com"
## 
##   timeouts {
##     create = "30m"
##     update = "40m"
##   }
## 
##   # disable_dependent_services = true
## }
## 
## resource "google_vpc_access_connector" "connector" {
##   provider      = google-beta
##   name          = "ideconn"
##   region        = var.gcp_region
##   network       = var.vpcNetworkName
##   ip_cidr_range = "10.8.0.0/28"
## 
##   min_throughput = 200
##   max_throughput = 300
## 
##   # Note: valid options: f1-micro, e2-micro, e2-standard-4
##   machine_type = var.vpcConnectorMachineType
## 
##   depends_on = [google_project_service.vpcaccess-api]
## }
## 
## 
## # Reference:
## # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service
## #
## # Enable the Cloud Run service
## resource "google_project_service" "run" {
##   project = var.gcp_project_id
##   service = "run.googleapis.com"
## 
##   timeouts {
##     create = "30m"
##     update = "40m"
##   }
## 
##   # disable_dependent_services = true
## }
## 
## 
## resource "google_cloud_run_service" "ide" {
##   name = var.gcrServiceName
##   # location = var.gcrRegion
##   location = var.gcp_region
## 
##   template {
##     spec {
##       containers {
##         # image = "gcr.io/qwiklabs-resources/ide-proxy:latest"
##         image = var.gcrContainerImage
##       }
##       container_concurrency = 2
##     }
## 
##     # Add support for vpc connector
##     metadata {
##       annotations = {
##         "autoscaling.knative.dev/maxScale"        = "3"
##         "autoscaling.knative.dev/minScale"        = "1"
##         "run.googleapis.com/vpc-access-egress"    = "all"
##         "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
##       }
##     }
##   }
## 
##   traffic {
##     percent         = 100
##     latest_revision = true
##   }
## 
##   # Dependency - Cloud Run API enabled
##   depends_on = [google_project_service.run, google_vpc_access_connector.connector]
## }
## 
## 
## data "google_iam_policy" "noauth" {
##   binding {
##     role = "roles/run.invoker"
##     members = [
##       "allUsers",
##     ]
##   }
## }
## 
## resource "google_cloud_run_service_iam_policy" "noauth" {
##   location = google_cloud_run_service.ide.location
##   project  = google_cloud_run_service.ide.project
##   service  = google_cloud_run_service.ide.name
## 
##   policy_data = data.google_iam_policy.noauth.policy_data
## }
