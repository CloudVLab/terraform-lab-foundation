# Terraform: OS Images

| Channel   | Status                          |
|---        |---                              |
| Dev       | Active Development & Testing    |
| Preview   | Preview Release                 |
| Stable    | Production Ready (Live Labs)    |

This module provisions OS images on Google Cloud.

## Accessing Output Values

This table compares the configured `image_id_short`, `image_name_short`, `image_id_long`, and `image_name_long` across the stable, preview, and development channels.

| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |
|---|---|---|---|---|
| `debian` | Debian OS image details. | `debian-12`<br>_(Debian 12)_<br><br>`debian-12-bookworm`<br>_(Debian GNU/Linux 12 (bookworm))_ | `debian-13`<br>_(Debian 13)_<br><br>`debian-13-trixie`<br>_(Debian GNU/Linux 13 (trixie))_ | `debian-13`<br>_(Debian 13)_<br><br>`debian-13-trixie`<br>_(Debian GNU/Linux 13 (trixie))_ |
| `centos_7` | Centos 7 details. | `centos-7`<br>_(CentOS 7)_<br><br>`centos-7`<br>_(CentOS 7)_ | `centos-7`<br>_(CentOS 7)_<br><br>`centos-7`<br>_(CentOS 7)_ | `centos-7`<br>_(CentOS 7)_<br><br>`centos-7`<br>_(CentOS 7)_ |
| `centos_7_v20201014` | Centos 7 V20201014 details. | `centos-7-v20201014`<br>_(CentOS 7 v20201014)_<br><br>`centos-7-v20201014`<br>_(CentOS 7 (v20201014))_ | `centos-7-v20201014`<br>_(CentOS 7 v20201014)_<br><br>`centos-7-v20201014`<br>_(CentOS 7 (v20201014))_ | `centos-7-v20201014`<br>_(CentOS 7 v20201014)_<br><br>`centos-7-v20201014`<br>_(CentOS 7 (v20201014))_ |
| `centos_stream_9` | Centos Stream 9 details. | `centos-stream-9`<br>_(CentOS Stream 9)_<br><br>`centos-stream-9`<br>_(CentOS Stream 9)_ | `centos-stream-9`<br>_(CentOS Stream 9)_<br><br>`centos-stream-9`<br>_(CentOS Stream 9)_ | `centos-stream-9`<br>_(CentOS Stream 9)_<br><br>`centos-stream-9`<br>_(CentOS Stream 9)_ |
| `ubuntu` | Ubuntu details. | `ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS)_<br><br>`ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS (Jammy Jellyfish))_ | `ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS)_<br><br>`ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS (Jammy Jellyfish))_ | *Not Available* |
| `ubuntu_1604` | Ubuntu 1604 details. | `ubuntu-1604-lts`<br>_(Ubuntu 16.04 LTS)_<br><br>`ubuntu-1604-lts`<br>_(Ubuntu 16.04 LTS (Xenial Xerus))_ | `ubuntu-1604-lts`<br>_(Ubuntu 16.04 LTS)_<br><br>`ubuntu-1604-lts`<br>_(Ubuntu 16.04 LTS (Xenial Xerus))_ | `ubuntu-1604-lts`<br>_(Ubuntu 16.04 LTS)_<br><br>`ubuntu-1604-lts`<br>_(Ubuntu 16.04 LTS (Xenial Xerus))_ |
| `ubuntu_1804` | Ubuntu 1804 details. | `ubuntu-1804-lts`<br>_(Ubuntu 18.04 LTS)_<br><br>`ubuntu-1804-lts`<br>_(Ubuntu 18.04 LTS (Bionic Beaver))_ | `ubuntu-1804-lts`<br>_(Ubuntu 18.04 LTS)_<br><br>`ubuntu-1804-lts`<br>_(Ubuntu 18.04 LTS (Bionic Beaver))_ | `ubuntu-1804-lts`<br>_(Ubuntu 18.04 LTS)_<br><br>`ubuntu-1804-lts`<br>_(Ubuntu 18.04 LTS (Bionic Beaver))_ |
| `ubuntu_2004` | Ubuntu 2004 details. | `ubuntu-2004-lts`<br>_(Ubuntu 20.04 LTS)_<br><br>`ubuntu-2004-lts`<br>_(Ubuntu 20.04 LTS (Focal Fossa))_ | `ubuntu-2004-lts`<br>_(Ubuntu 20.04 LTS)_<br><br>`ubuntu-2004-lts`<br>_(Ubuntu 20.04 LTS (Focal Fossa))_ | `ubuntu-2004-lts`<br>_(Ubuntu 20.04 LTS)_<br><br>`ubuntu-2004-lts`<br>_(Ubuntu 20.04 LTS (Focal Fossa))_ |
| `ubuntu_2204` | Ubuntu 2204 details. | `ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS)_<br><br>`ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS (Jammy Jellyfish))_ | `ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS)_<br><br>`ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS (Jammy Jellyfish))_ | `ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS)_<br><br>`ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS (Jammy Jellyfish))_ |
| `ubuntu_2404` | Ubuntu 2404 details. | *Not Available* | *Not Available* | `ubuntu-2404-lts`<br>_(Ubuntu 24.04 LTS)_<br><br>`ubuntu-2404-lts`<br>_(Ubuntu 24.04 LTS (Noble Numbat))_ |
| `ubuntu_2404_arm64` | Ubuntu 2404 Arm64 details. | `ubuntu-2404-lts-arm64`<br>_(Ubuntu 24.04 LTS (ARM64))_<br><br>`ubuntu-2404-lts-arm64`<br>_(Ubuntu 24.04 LTS (Noble Numbat ARM64))_ | `ubuntu-2404-lts-arm64`<br>_(Ubuntu 24.04 LTS (ARM64))_<br><br>`ubuntu-2404-lts-arm64`<br>_(Ubuntu 24.04 LTS (Noble Numbat ARM64))_ | `ubuntu-2404-lts-arm64`<br>_(Ubuntu 24.04 LTS (ARM64))_<br><br>`ubuntu-2404-lts-arm64`<br>_(Ubuntu 24.04 LTS (Noble Numbat ARM64))_ |
| `ubuntu_2404_minimal` | Ubuntu 2404 Minimal details. | `ubuntu-minimal-2404-lts-amd64`<br>_(Ubuntu Minimal 24.04 LTS)_<br><br>`ubuntu-minimal-2404-lts-amd64`<br>_(Ubuntu Minimal 24.04 LTS (Noble Numbat))_ | `ubuntu-minimal-2404-lts-amd64`<br>_(Ubuntu Minimal 24.04 LTS)_<br><br>`ubuntu-minimal-2404-lts-amd64`<br>_(Ubuntu Minimal 24.04 LTS (Noble Numbat))_ | `ubuntu-minimal-2404-lts-amd64`<br>_(Ubuntu Minimal 24.04 LTS)_<br><br>`ubuntu-minimal-2404-lts-amd64`<br>_(Ubuntu Minimal 24.04 LTS (Noble Numbat))_ |
| `windows_2016` | Windows 2016 details. | `windows-2016`<br>_(Windows Server 2016)_<br><br>`windows-2016`<br>_(Windows Server 2016)_ | `windows-2016`<br>_(Windows Server 2016)_<br><br>`windows-2016`<br>_(Windows Server 2016)_ | `windows-2016`<br>_(Windows Server 2016)_<br><br>`windows-2016`<br>_(Windows Server 2016)_ |
| `windows_2016_dc` | Windows 2016 Dc details. | `windows-server-2016-dc`<br>_(Windows Server 2016 Datacenter)_<br><br>`windows-server-2016-dc`<br>_(Windows Server 2016 Datacenter)_ | `windows-server-2016-dc`<br>_(Windows Server 2016 Datacenter)_<br><br>`windows-server-2016-dc`<br>_(Windows Server 2016 Datacenter)_ | `windows-server-2016-dc`<br>_(Windows Server 2016 Datacenter)_<br><br>`windows-server-2016-dc`<br>_(Windows Server 2016 Datacenter)_ |
| `windows_2019` | Windows 2019 details. | `windows-2019`<br>_(Windows Server 2019)_<br><br>`windows-2019`<br>_(Windows Server 2019)_ | `windows-2019`<br>_(Windows Server 2019)_<br><br>`windows-2019`<br>_(Windows Server 2019)_ | `windows-2019`<br>_(Windows Server 2019)_<br><br>`windows-2019`<br>_(Windows Server 2019)_ |
| `windows_2019_containers_v20201110` | Windows 2019 Containers V20201110 details. | `windows-server-2019-dc-core-for-containers-v20201110`<br>_(Windows Server 2019 DC Core for Containers v20201110)_<br><br>`windows-server-2019-dc-core-for-containers-v20201110`<br>_(Windows Server 2019 Datacenter Core for Containers (v20201110))_ | `windows-server-2019-dc-core-for-containers-v20201110`<br>_(Windows Server 2019 DC Core for Containers v20201110)_<br><br>`windows-server-2019-dc-core-for-containers-v20201110`<br>_(Windows Server 2019 Datacenter Core for Containers (v20201110))_ | `windows-server-2019-dc-core-for-containers-v20201110`<br>_(Windows Server 2019 DC Core for Containers v20201110)_<br><br>`windows-server-2019-dc-core-for-containers-v20201110`<br>_(Windows Server 2019 Datacenter Core for Containers (v20201110))_ |
| `windows_2019_dc` | Windows 2019 Dc details. | `windows-server-2019-dc`<br>_(Windows Server 2019 Datacenter)_<br><br>`windows-server-2019-dc`<br>_(Windows Server 2019 Datacenter)_ | `windows-server-2019-dc`<br>_(Windows Server 2019 Datacenter)_<br><br>`windows-server-2019-dc`<br>_(Windows Server 2019 Datacenter)_ | `windows-server-2019-dc`<br>_(Windows Server 2019 Datacenter)_<br><br>`windows-server-2019-dc`<br>_(Windows Server 2019 Datacenter)_ |
| `windows_2022` | Windows 2022 details. | `windows-2022`<br>_(Windows Server 2022)_<br><br>`windows-2022`<br>_(Windows Server 2022)_ | `windows-2022`<br>_(Windows Server 2022)_<br><br>`windows-2022`<br>_(Windows Server 2022)_ | `windows-2022`<br>_(Windows Server 2022)_<br><br>`windows-2022`<br>_(Windows Server 2022)_ |
| `windows_2022_dc` | Windows 2022 Dc details. | `windows-server-2022-dc`<br>_(Windows Server 2022 Datacenter)_<br><br>`windows-server-2022-dc`<br>_(Windows Server 2022 Datacenter)_ | `windows-server-2022-dc`<br>_(Windows Server 2022 Datacenter)_<br><br>`windows-server-2022-dc`<br>_(Windows Server 2022 Datacenter)_ | `windows-server-2022-dc`<br>_(Windows Server 2022 Datacenter)_<br><br>`windows-server-2022-dc`<br>_(Windows Server 2022 Datacenter)_ |
## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.