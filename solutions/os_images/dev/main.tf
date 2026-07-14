# solutions/os_images/dev/main.tf
locals {
  os_images = {
    "debian" = {
      "image_id_short"   = "debian-13"
      "image_name_short" = "Debian 13"
      "image_id_long"    = "debian-13-trixie"
      "image_name_long"  = "Debian GNU/Linux 13 (trixie)"
    }
    "ubuntu_2404" = {
      "image_id_short"   = "ubuntu-2404-lts"
      "image_name_short" = "Ubuntu 24.04 LTS"
      "image_id_long"    = "ubuntu-2404-lts"
      "image_name_long"  = "Ubuntu 24.04 LTS (Noble Numbat)"
      "image_project"    = "ubuntu-os-cloud/ubuntu-2404-lts"
    }
    "ubuntu_2204" = {
      "image_id_short"   = "ubuntu-2204-lts"
      "image_name_short" = "Ubuntu 22.04 LTS"
      "image_id_long"    = "ubuntu-2204-lts"
      "image_name_long"  = "Ubuntu 22.04 LTS (Jammy Jellyfish)"
      "image_project"    = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
    "ubuntu_2004" = {
      "image_id_short"   = "ubuntu-2004-lts"
      "image_name_short" = "Ubuntu 20.04 LTS"
      "image_id_long"    = "ubuntu-2004-lts"
      "image_name_long"  = "Ubuntu 20.04 LTS (Focal Fossa)"
      "image_project"    = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
    "ubuntu_2404_minimal" = {
      "image_id_short"   = "ubuntu-minimal-2404-lts-amd64"
      "image_name_short" = "Ubuntu Minimal 24.04 LTS"
      "image_id_long"    = "ubuntu-minimal-2404-lts-amd64"
      "image_name_long"  = "Ubuntu Minimal 24.04 LTS (Noble Numbat)"
      "image_project"    = "ubuntu-os-cloud/ubuntu-minimal-2404-lts-amd64"
    }
    "ubuntu_2404_arm64" = {
      "image_id_short"   = "ubuntu-2404-lts-arm64"
      "image_name_short" = "Ubuntu 24.04 LTS (ARM64)"
      "image_id_long"    = "ubuntu-2404-lts-arm64"
      "image_name_long"  = "Ubuntu 24.04 LTS (Noble Numbat ARM64)"
      "image_project"    = "ubuntu-os-cloud/ubuntu-2404-lts-arm64"
    }
    "ubuntu_1804" = {
      "image_id_short"   = "ubuntu-1804-lts"
      "image_name_short" = "Ubuntu 18.04 LTS"
      "image_id_long"    = "ubuntu-1804-lts"
      "image_name_long"  = "Ubuntu 18.04 LTS (Bionic Beaver)"
      "image_project"    = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
    "ubuntu_1604" = {
      "image_id_short"   = "ubuntu-1604-lts"
      "image_name_short" = "Ubuntu 16.04 LTS"
      "image_id_long"    = "ubuntu-1604-lts"
      "image_name_long"  = "Ubuntu 16.04 LTS (Xenial Xerus)"
      "image_project"    = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
    "centos_7" = {
      "image_id_short"   = "centos-7"
      "image_name_short" = "CentOS 7"
      "image_id_long"    = "centos-7"
      "image_name_long"  = "CentOS 7"
      "image_project"    = "centos-cloud/centos-7"
    }
    "centos_7_v20201014" = {
      "image_id_short"   = "centos-7-v20201014"
      "image_name_short" = "CentOS 7 v20201014"
      "image_id_long"    = "centos-7-v20201014"
      "image_name_long"  = "CentOS 7 (v20201014)"
      "image_project"    = "centos-cloud/centos-7-v20201014"
    }
    "centos_stream_9" = {
      "image_id_short"   = "centos-stream-9"
      "image_name_short" = "CentOS Stream 9"
      "image_id_long"    = "centos-stream-9"
      "image_name_long"  = "CentOS Stream 9"
      "image_project"    = "centos-cloud/centos-stream-9"
    }
    "windows_2022" = {
      "image_id_short"   = "windows-2022"
      "image_name_short" = "Windows Server 2022"
      "image_id_long"    = "windows-2022"
      "image_name_long"  = "Windows Server 2022"
      "image_project"    = "windows-cloud"
    }
    "windows_2019" = {
      "image_id_short"   = "windows-2019"
      "image_name_short" = "Windows Server 2019"
      "image_id_long"    = "windows-2019"
      "image_name_long"  = "Windows Server 2019"
      "image_project"    = "windows-cloud"
    }
    "windows_2016" = {
      "image_id_short"   = "windows-2016"
      "image_name_short" = "Windows Server 2016"
      "image_id_long"    = "windows-2016"
      "image_name_long"  = "Windows Server 2016"
      "image_project"    = "windows-cloud"
    }
    "windows_2019_containers_v20201110" = {
      "image_id_short"   = "windows-server-2019-dc-core-for-containers-v20201110"
      "image_name_short" = "Windows Server 2019 DC Core for Containers v20201110"
      "image_id_long"    = "windows-server-2019-dc-core-for-containers-v20201110"
      "image_name_long"  = "Windows Server 2019 Datacenter Core for Containers (v20201110)"
      "image_project"    = "windows-cloud"
    }
    "windows_2022_dc" = {
      "image_id_short"   = "windows-server-2022-dc"
      "image_name_short" = "Windows Server 2022 Datacenter"
      "image_id_long"    = "windows-server-2022-dc"
      "image_name_long"  = "Windows Server 2022 Datacenter"
      "image_project"    = "windows-cloud"
    }
    "windows_2019_dc" = {
      "image_id_short"   = "windows-server-2019-dc"
      "image_name_short" = "Windows Server 2019 Datacenter"
      "image_id_long"    = "windows-server-2019-dc"
      "image_name_long"  = "Windows Server 2019 Datacenter"
      "image_project"    = "windows-cloud"
    }
    "windows_2016_dc" = {
      "image_id_short"   = "windows-server-2016-dc"
      "image_name_short" = "Windows Server 2016 Datacenter"
      "image_id_long"    = "windows-server-2016-dc"
      "image_name_long"  = "Windows Server 2016 Datacenter"
      "image_project"    = "windows-cloud"
    }
  }
}
