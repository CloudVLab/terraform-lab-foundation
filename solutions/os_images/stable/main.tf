# solutions/os_images/stable/main.tf
locals {
  os_images = {
    centos = {
      image_id_long    = "centos-stream-9"
      image_id_short   = "centos-stream-9"
      image_name_long  = "CentOS Stream 9"
      image_name_short = "CentOS Stream 9"
      image_project    = "centos-cloud"
    }
    debian = {
      image_id_long    = "debian-12-bookworm"
      image_id_short   = "debian-12"
      image_name_long  = "Debian GNU/Linux 12 (bookworm)"
      image_name_short = "Debian 12"
      image_project    = "debian-cloud"
    }
    ubuntu = {
      image_id_long    = "ubuntu-2204-jammy"
      image_id_short   = "ubuntu-2204-lts"
      image_name_long  = "Ubuntu 22.04 LTS (Jammy Jellyfish)"
      image_name_short = "Ubuntu 22.04 LTS"
      image_project    = "ubuntu-os-cloud"
    }
    windows = {
      image_id_long    = "windows-server-2022-dc"
      image_id_short   = "windows-2022"
      image_name_long  = "Windows Server 2022 Datacenter"
      image_name_short = "Windows Server 2022"
      image_project    = "windows-cloud"
    }
  }
}
