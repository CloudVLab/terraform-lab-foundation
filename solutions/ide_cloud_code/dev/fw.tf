# Module: Virtual Private Cloud

## ----------------------------------------------------------------------------
# Reference:
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall
# https://github.com/terraform-google-modules/terraform-google-network/tree/master/modules/firewall-rules

module "la_fw" {
  ## NOTE: When changing the source parameter, `terraform init` is required

  ## REMOTE: GitHub (Public) access - working 
  source = "github.com/CloudVLab/terraform-lab-foundation//basics/vpc_firewall/stable"

  # Pass values to the module
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
  gcp_zone       = var.gcp_zone

  fwr_network      = module.la_vpc.vpc_network_name

  # Firewall Policy - Repeatable list of objects
  fwr_rules = [
    {
      fwr_name                    = "${module.la_vpc.vpc_network_name}-allow-internal"
      fwr_description             = "Private internal communication"
      fwr_source_ranges           = [ "${var.vpcSubnetCidr}" ]
      fwr_destination_ranges      = null
      fwr_source_tags             = null
      fwr_source_service_accounts = null
      fwr_target_tags             = null 
      fwr_target_service_accounts = null
      fwr_priority                = "1000"
      fwr_direction               = "INGRESS"

      # Allow List
      allow = [
        {
          protocol     = "tcp"
          ports        = [ "0-65535" ] 
        },
        {
          protocol     = "udp"
          ports        = [ "0-65535" ] 
        }
      ]

      # Deny List
      deny = []

      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
    },
    {
      fwr_name                    = "${module.la_vpc.vpc_network_name}-allow-wagtail"
      fwr_description             = "Private internal communication"
      fwr_source_ranges           = [ "0.0.0.0" ]
      fwr_destination_ranges      = null
      fwr_source_tags             = null
      fwr_source_service_accounts = null
      fwr_target_tags             = [ "lab-vm" ] 
      fwr_target_service_accounts = null
      fwr_priority                = "1000"
      fwr_direction               = "INGRESS"

      # Allow List
      allow = [
        {
          protocol     = "tcp"
          ports        = [ "8000", "80", "443" ] 
        }
      ]

      # Deny List
      deny = []

      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
    }
##    {
##      fwr_name                    = "custom-allow-internal"
##      fwr_description             = "Private internal communication"
##      fwr_source_ranges           = [ "${var.vpcSubnetCidr}" ]
##      fwr_destination_ranges      = null
##      fwr_source_tags             = null
##      fwr_source_service_accounts = null
##      fwr_target_tags             = null 
##      fwr_target_service_accounts = null
##      fwr_priority                = "65534"
##      fwr_direction               = "INGRESS"
##
##      # Allow List
##      allow = [
##        {
##          protocol     = "tcp"
##          ports        = [ "0-65535" ] 
##        },
##        {
##          protocol     = "udp"
##          ports        = [ "0-65535" ] 
##        }
##      ]
##
##      # Deny List
##      deny = []
##
##      log_config = {
##        metadata = "INCLUDE_ALL_METADATA"
##      }
##    }
 ]

  ## Firewall depends on existence of Network
  depends_on = [ module.la_vpc.vpc_network_name ]
}
