# solutions/os_images/preview/main.tf
locals {
  os_images = {
    "debian" = {
      "image_id_short"   = "debian-13"
      "image_name_short" = "Debian 13" 
      "image_id_long"    = "debian-13-trixie"
      "image_name_long"  = "Debian GNU/Linux 13 (trixie)" 
    }
  }
}
