## Create a Cloud Run container 
## ----------------------------------------------------------------------------

resource "google_cloud_run_v2_service" "proxy" {
  name         = var.gcrServiceName
  location     = var.gcp_region
  launch_stage = "BETA"
  template {
    containers {
      image = var.gcrServiceImage
    }
    vpc_access {
      network_interfaces {
        network    = var.gcrNetworkName
        subnetwork = var.gcrSubnetName
        # network = module.la_vpc.vpc_network_name
        # subnetwork = module.la_vpc.vpc_subnetwork_name
        # network = google_compute_network.dev_network.id 
        # subnetwork = google_compute_subnetwork.dev_subnet.id
        tags = var.gcrInstanceTags
      }
      egress = var.gcrServiceEgress
    }
  }
}

## Set access for the Cloud Run service
resource "google_cloud_run_service_iam_binding" "public" {
  location = google_cloud_run_v2_service.proxy.location
  service  = google_cloud_run_v2_service.proxy.name
  role     = var.gcrServiceRole 
  members  = var.gcrMemberAccess
}
