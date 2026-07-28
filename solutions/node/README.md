# Terraform: Node

| Channel   | Status                          |
|---        |---                              |
| Dev       | Active Development & Testing    |
| Preview   | Preview Release                 |
| Stable    | Production Ready (Live Labs)    |

This module provisions node details.

## Accessing Output Values

This table compares the configured Node.js runtime details across the stable, preview, and development channels.

| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |
|---|---|---|---|---|
| `node` | Node.js runtime configuration object. | `22`<br>_(Node.js 22 LTS)_<br><br>Runtime: `nodejs22`<br>NVM: `nvm install 22`<br>Docker: `node:22-slim` | `24`<br>_(Node.js 24)_<br><br>Runtime: `nodejs24`<br>NVM: `nvm install 24`<br>Docker: `node:24-slim` | `20`<br>_(Node.js 20 LTS)_<br><br>Runtime: `nodejs20`<br>NVM: `nvm install 20`<br>Docker: `node:20-slim` |
## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.