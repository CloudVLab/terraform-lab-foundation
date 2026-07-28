# Terraform: OS Images

| Channel   | Status                          |
|---        |---                              |
| Dev       | Active Development & Testing    |
| Preview   | Preview Release                 |
| Stable    | Production Ready (Live Labs)    |

This module provisions OS images on Google Cloud.

## Accessing Output Values

This table compares the configured `image_id_short` and `image_name_short` across the stable, preview, and development channels.

| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |
|---|---|---|---|---|
| `os_images` | A map of all configured OS images. | *Full Map* | *Full Map* | *Full Map* |
| `centos` | CentOS OS image details. | `centos-stream-9`<br>_(CentOS Stream 9)_ | `centos-stream-9`<br>_(CentOS Stream 9)_ | `centos-stream-9`<br>_(CentOS Stream 9)_ |
| `debian` | Debian OS image details. | `debian-12`<br>_(Debian 12)_ | `debian-13`<br>_(Debian 13)_ | `debian-13`<br>_(Debian 13)_ |
| `ubuntu` | Ubuntu OS image details. | `ubuntu-2204-lts`<br>_(Ubuntu 22.04 LTS)_ | `ubuntu-2404-lts`<br>_(Ubuntu 24.04 LTS)_ | `ubuntu-2404-lts`<br>_(Ubuntu 24.04 LTS)_ |
| `windows` | Windows Server OS image details. | `windows-2022`<br>_(Windows Server 2022)_ | `windows-2025`<br>_(Windows Server 2025)_ | `windows-2025`<br>_(Windows Server 2025)_ |
## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.