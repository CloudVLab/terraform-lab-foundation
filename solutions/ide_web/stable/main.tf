# Module: Virtual Private Cloud 
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
#
module "la_vpc" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  # source = "./basics/vpc_network/stable"

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/vpc_network/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  # Customise the GCS instance
  vpc_network             = "dev-network"
  vpc_network_description = "Developer network" 
  vpc_subnet              = "dev-subnetwork"
  vpc_region              = "us-central1" 
  vpc_subnet_cidr         = "10.128.0.0/16" 
}


# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
# https://github.com/terraform-google-modules/terraform-google-network/tree/master/modules/firewall-rules
module "la_fw" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## Local Modules - working
  ## Module subdirectory needs to be defined within the TF directory
  # source = "./basics/vpc_firewall/stable"

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/vpc_firewall/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  #fwr_network      = "default" 
  fwr_network      = module.la_vpc.vpc_network_name

  fwr_rules = [
  {
    fwr_name                    = "serverless-to-vpc-connector"
    fwr_description             = "serverless-to-vpc-connector"
    fwr_source_ranges           = [ "107.178.230.64/26", "35.199.224.0/19" ]
    fwr_destination_ranges      = null
    fwr_source_tags             = null
    fwr_source_service_accounts = null
    fwr_target_tags             = ["vpc-connector"]
    fwr_target_service_accounts = null
    fwr_priority                = "1000"
    fwr_direction               = "INGRESS"

    # Allow List
    allow = [{
      protocol     = "icmp"
      ports        = null 
    },
    {
      protocol     = "tcp"
      ports        = [ "667" ]
    },
    {
      protocol     = "udp"
      ports        = [ "665-666" ]
    }]

    # Deny List
    deny = []

    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }

  },
  {
    fwr_name                    = "vpc-connector-to-serverless"
    fwr_description             = "vpc-connector-to-serverless"
    fwr_source_ranges           = [ "107.178.230.64/26", "35.199.224.0/19" ]
    fwr_destination_ranges      = null
    fwr_source_tags             = null
    fwr_source_service_accounts = null
    fwr_target_tags             = ["vpc-connector"]
    fwr_target_service_accounts = null
    fwr_priority                = "1000"
    fwr_direction               = "EGRESS"

    # Allow List
    allow = [{
      protocol     = "icmp"
      ports        = null 
    },
    {
      protocol     = "tcp"
      ports        = [ "667" ]
    },
    {
      protocol     = "udp"
      ports        = [ "665-666" ]
    }]

    # Deny List
    deny = []

    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  },
  {
    fwr_name                    = "vpc-connector-health-check"
    fwr_description             = "vpc-connector-health-check"
    fwr_source_ranges           = [ "130.211.0.0/22", "35.191.0.0/16", "108.170.220.0/23" ]
    fwr_destination_ranges      = null
    fwr_source_tags             = null
    fwr_source_service_accounts = null
    fwr_target_tags             = ["vpc-connector"]
    fwr_target_service_accounts = null
    fwr_priority                = "1000"
    fwr_direction               = "INGRESS"

    # Allow List
    allow = [{
      protocol     = "tcp"
      ports        = [ "667" ]
    }]

    # Deny List
    deny = []

    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  },
  {
    fwr_name                    = "vpc-connector-egress"
    fwr_description             = "vpc-connector-egress"
    fwr_source_ranges           = null 
    fwr_destination_ranges      = null
    fwr_source_tags             = [ "vpc-connector" ] 
    fwr_source_service_accounts = null
    fwr_target_tags             = null 
    fwr_target_service_accounts = null
    fwr_priority                = "1000"
    fwr_direction               = "INGRESS"

    # Allow List
    allow = [{
      protocol     = "tcp"
      ports        = [ "all" ]
    },
    {
      protocol     = "udp"
      ports        = [ "all" ]
    },
    {
      protocol     = "icmp"
      ports        = null 
    }]

    # Deny List
    deny = []

    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }
  ]

  depends_on = [ module.la_vpc.vpc_network_name ]
}

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector

# Enable the vpc access service
resource "google_project_service" "vpcaccess-api" {
  project = var.gcp_project_id
  service = "vpcaccess.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}

resource "google_vpc_access_connector" "connector" {
  provider      = google-beta
  name          = "ideconn"
  region        = var.gcp_region
  network       = module.la_vpc.vpc_network_name
  ip_cidr_range = "10.8.0.0/28"

  # Note: valid options: f1-micro, e2-micro, e2-standard-4
  machine_type = var.vpcConnectorMachineType 

  depends_on = [
    google_project_service.vpcaccess-api, module.la_vpc.vpc_network_name 
  ]
}


# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service
#
# Enable the Cloud Run service
resource "google_project_service" "run" {
  project = var.gcp_project_id
  service = "run.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  # disable_dependent_services = true
}


resource "google_cloud_run_service" "ide" {
  name     = "ide-service" 
  location = var.gcrRegion

  template {
    spec {
      containers {
        image = "gcr.io/qwiklabs-resources/ide-proxy:latest"
      }
      container_concurrency = 2
    }

    # Add support for vpc connector
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "3"
        "autoscaling.knative.dev/minScale" = "1"
        "run.googleapis.com/vpc-access-egress" = "all"
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }

  # Dependency - Cloud Run API enabled
  depends_on = [ google_project_service.run, module.la_gce ]
}


resource "google_cloud_run_service" "browser" {
  name     = "browser-service"
  location = var.gcrRegion

  template {
    spec {
      containers {
        image = "gcr.io/qwiklabs-resources/web-proxy:latest"
      }
      container_concurrency = 2
    }

    # Add support for vpc connector
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "3"
        "autoscaling.knative.dev/minScale" = "1"
        "run.googleapis.com/vpc-access-egress" = "all"
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.name
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }

  # Dependency - Cloud Run API enabled
  depends_on = [ google_project_service.run, module.la_gce ]
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "ide_noauth" {
  location    = google_cloud_run_service.ide.location
  project     = google_cloud_run_service.ide.project
  service     = google_cloud_run_service.ide.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

resource "google_cloud_run_service_iam_policy" "browser_noauth" {
  location    = google_cloud_run_service.browser.location
  project     = google_cloud_run_service.browser.project
  service     = google_cloud_run_service.browser.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_instance
data "google_compute_image" "image_family" {
  family  = var.gceMachineImage 
  project = "qwiklabs-resources"
}

# GCE:    Virtual Machine
# Local:  modules/[channel]
# Remote: github.com://CloudVLab/terraform-lab-foundation//[module]/[channel]

# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance
#

# Module: Google Compute Engine
module "la_gce" {
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/gce_instance/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone
  gcp_username   = var.gcp_username

  # Customise the GCE instance
  gce_name            = var.gceInstanceName
  gce_region          = var.gcp_region
  gce_zone            = var.gceInstanceZone
  gce_machine_type    = var.gceMachineType
  gce_tags            = var.gceInstanceTags 
  #gce_machine_image   = "debian-cloud/debian-10" 
  gce_machine_network = module.la_vpc.vpc_subnet.name
  gce_scopes          = ["cloud-platform"] 
  #gce_startup_script   = "${file("./scripts/lab-init")}"
}
