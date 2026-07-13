# solutions/os_images/dev/main.tf
locals {
  os_images = {
    "debian" = {
      "image_id_short"   = "debian-13"
      "image_name_short" = "Debian 13" 
      "image_id_long"    = "debian-13-trixie"
      "image_name_long"  = "Debian GNU/Linux 13 (trixie)" 
    }
    "ubuntu" = {
      "image_id_short"   = "ubuntu-2204-lts"
      "image_name_short" = "Ubuntu 22.04 LTS" 
      "image_id_long"    = "ubuntu-2204-lts"
      "image_name_long"  = "Ubuntu 22.04 LTS"
      "image_project"    = "ubuntu-os-cloud"
    }
  }
}
