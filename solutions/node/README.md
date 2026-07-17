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
| `v20` | V20 details. | `20`<br>_(Node.js 20)_<br><br>`` | `20`<br>_(Node.js 20)_<br><br>`` | `20`<br>_(Node.js 20)_<br><br>`` |
| `v22` | V22 details. | `22`<br>_(Node.js 22)_<br><br>`` | `22`<br>_(Node.js 22)_<br><br>`` | `22`<br>_(Node.js 22)_<br><br>`` |
| `v22_14_0` | V22 14 0 details. | `22.14.0`<br>_(Node.js 22.14.0)_<br><br>`` | `22.14.0`<br>_(Node.js 22.14.0)_<br><br>`` | `22.14.0`<br>_(Node.js 22.14.0)_<br><br>`` |
| `v24` | V24 details. | `24`<br>_(Node.js 24)_<br><br>`` | `24`<br>_(Node.js 24)_<br><br>`` | `24`<br>_(Node.js 24)_<br><br>`` |
| `v6_9_2` | V6 9 2 details. | `6.9.2`<br>_(Node.js 6.9.2)_<br><br>`` | `6.9.2`<br>_(Node.js 6.9.2)_<br><br>`` | `6.9.2`<br>_(Node.js 6.9.2)_<br><br>`` |
## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.