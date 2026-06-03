# solutions/os_images/stable/main.tf
locals {
  os_images = {
    "debian" = {
      "image_id_short"   = "debian-12"
      "image_name_short" = "Debian 12" 
      "image_id_long"    = "debian-12-bookworm"
      "image_name_long"  = "Debian GNU/Linux 12 (bookworm)" 
    }
  }
}
