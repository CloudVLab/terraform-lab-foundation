# TODO: Migrate to Module - Cloud Run V2 


## Create a Cloud Run container 
## ----------------------------------------------------------------------------

resource "google_cloud_run_v2_service" "ide" {
  name     = var.gcrIDEService 
  location = var.gcp_region 
  launch_stage = "BETA"
  template {
    containers {
      image = "gcr.io/qwiklabs-resources/test-ide-proxy:latest"
    }
    vpc_access{
      network_interfaces {
        network = module.la_vpc.vpc_network_name
        subnetwork = module.la_vpc.vpc_subnetwork_name
        # network = google_compute_network.dev_network.id 
        # subnetwork = google_compute_subnetwork.dev_subnet.id
        tags = var.gceInstanceTags
      }
      egress = "ALL_TRAFFIC"
    }
  }
}

resource "google_cloud_run_service_iam_binding" "public" {
  location = google_cloud_run_v2_service.ide.location
  service  = google_cloud_run_v2_service.ide.name
  role     = "roles/run.invoker"
  members  = [
    "allUsers"
  ]
}
