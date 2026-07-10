# Terraform: Node

| Channel   | Status                          |
|---        |---                              |
| Dev       | Active Development & Testing    |
| Preview   | Preview Release                 |
| Stable    | Production Ready (Live Labs)    |

This module provisions node details.

## Accessing Output Values

This table compares the configured `name`, `version`, and `command` across the stable, preview, and development channels.

| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |
|---|---|---|---|---|
| `node` | A map of all available node details. | *Full Map* | *Full Map* | *Full Map* |
| `lts` | Lts details. | `lts`<br>_(Node.js LTS)_<br><br>`nvm install --lts` | `lts`<br>_(Node.js LTS)_<br><br>`nvm install --lts` | `lts`<br>_(Node.js LTS)_<br><br>`nvm install --lts` |
| `v20` | V20 details. | `20`<br>_(Node.js 20)_<br><br>`nvm install 20` | `20`<br>_(Node.js 20)_<br><br>`nvm install 20` | `20`<br>_(Node.js 20)_<br><br>`nvm install 20` |
| `v22` | V22 details. | `22`<br>_(Node.js 22)_<br><br>`nvm install 22` | `22`<br>_(Node.js 22)_<br><br>`nvm install 22` | `22`<br>_(Node.js 22)_<br><br>`nvm install 22` |
| `v22_14_0` | V22 14 0 details. | `22.14.0`<br>_(Node.js 22.14.0)_<br><br>`nvm install 22.14.0` | `22.14.0`<br>_(Node.js 22.14.0)_<br><br>`nvm install 22.14.0` | `22.14.0`<br>_(Node.js 22.14.0)_<br><br>`nvm install 22.14.0` |
| `v24` | V24 details. | `24`<br>_(Node.js 24)_<br><br>`nvm install 24` | `24`<br>_(Node.js 24)_<br><br>`nvm install 24` | `24`<br>_(Node.js 24)_<br><br>`nvm install 24` |

## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.