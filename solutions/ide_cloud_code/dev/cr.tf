# Module: Cloud Run Gen v2 
module "la_cloud_run" {
  #source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable?ref=tlf-basics"
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable/v1"
  # source = "gcs::https://storage.googleapis.com/terraform-lab-foundation/basics/cloud_run/stable"
  # source = "github.com/CloudVLab/terraform-lab-foundation//basics/cloud_run/stable"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/cloud_run/stable/v2"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the service 
  gcrServiceName  = "ide-service"
  gcrServiceImage = "gcr.io/qwiklabs-resources/ide-proxy-v1:latest"
  gcrNetworkName  = module.la_vpc.vpc_network_name
  gcrSubnetName   = module.la_vpc.vpc_subnetwork_name
}

# Module: Cloud Run Gen v2 - BROWSER
module "la_cloud_run_browser" {
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/basics/cloud_run/stable/v2"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the service
  gcrServiceName  = "browser-service"
  gcrServiceImage = "gcr.io/qwiklabs-resources/web-proxy-v1:latest"
  gcrNetworkName  = module.la_vpc.vpc_network_name
  gcrSubnetName   = module.la_vpc.vpc_subnetwork_name
}
