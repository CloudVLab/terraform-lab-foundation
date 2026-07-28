# solutions/os_images/dev/main.tf
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
      image_id_long    = "debian-13-trixie"
      image_id_short   = "debian-13"
      image_name_long  = "Debian GNU/Linux 13 (trixie)"
      image_name_short = "Debian 13"
      image_project    = "debian-cloud"
    }
    ubuntu = {
      image_id_long    = "ubuntu-2404-noble"
      image_id_short   = "ubuntu-2404-lts"
      image_name_long  = "Ubuntu 24.04 LTS (Noble Numbat)"
      image_name_short = "Ubuntu 24.04 LTS"
      image_project    = "ubuntu-os-cloud"
    }
    windows = {
      image_id_long    = "windows-server-2025-dc"
      image_id_short   = "windows-2025"
      image_name_long  = "Windows Server 2025 Datacenter"
      image_name_short = "Windows Server 2025"
      image_project    = "windows-cloud"
    }
  }
}
