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

  # fwr_network      = "default"
  fwr_network      = module.la_vpc.vpc_network_name

  fwr_rules = [
    {
      fwr_name                    = "${module.la_vpc.vpc_network_name}-allow-internal"
      fwr_description             = "Internal communication"
      fwr_source_ranges           = [ "${var.vpcSubnetCidr}" ]
      fwr_destination_ranges      = null
      fwr_source_tags             = null
      fwr_source_service_accounts = null
      fwr_target_tags             = [ "cls" ]
      ## fwr_target_tags             = [ "cls", "lab-vm" ]
      fwr_target_service_accounts = null
      fwr_priority                = "1000"
      fwr_direction               = "INGRESS"

      # Allow List
      allow = [
        { protocol     = "tcp"
          ports        = [ "0-65535" ]
        },
        { protocol     = "udp"
          ports        = [ "0-65535" ]
        }
      ]

      # Deny List
      deny = []

      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
    }
  ]

  depends_on = [ module.la_vpc.vpc_network_name ]
}
