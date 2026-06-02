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
| `debian` | Debian OS image details. | `debian-12`<br>_(Debian 12)_ | `debian-13`<br>_(Debian 13)_ | `debian-13`<br>_(Debian 13)_ |
## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.