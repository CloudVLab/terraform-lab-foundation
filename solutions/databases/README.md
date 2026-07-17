# Terraform: SQL Database Versions

| Channel   | Status                          |
|---        |---                              |
| Dev       | Active Development & Testing    |
| Preview   | Preview Release                 |
| Stable    | Production Ready (Live Labs)    |

This module provisions standard database version variables.

## Accessing Output Values

This table compares the configured `name` and `version` across the stable, preview, and development channels.

| Output Field | Description | Stable Channel | Preview Channel | Dev Channel |
|---|---|---|---|---|
| `db_versions` | A map of all configured database versions. | *Full Map* | *Full Map* | *Full Map* |
| `mysql` | MySQL database version details. | `8.0`<br>_(MySQL 8.0)_ | `8.4`<br>_(MySQL 8.4)_ | `8.4`<br>_(MySQL 8.4)_ |
| `postgres` | PostgreSQL database version details. | `14`<br>_(PostgreSQL 14)_ | `15`<br>_(PostgreSQL 15)_ | `16`<br>_(PostgreSQL 16)_ |
| `sqlserver_enterprise` | SQL Server Enterprise database version details. | `2022`<br>_(SQL Server 2022 Enterprise)_ | `2025`<br>_(SQL Server 2025 Enterprise)_ | `2025`<br>_(SQL Server 2025 Enterprise)_ |
| `sqlserver_express` | SQL Server Express database version details. | `2022`<br>_(SQL Server 2022 Express)_ | `2025`<br>_(SQL Server 2025 Express)_ | `2025`<br>_(SQL Server 2025 Express)_ |
| `sqlserver_standard` | SQL Server Standard database version details. | `2022`<br>_(SQL Server 2022 Standard)_ | `2025`<br>_(SQL Server 2025 Standard)_ | `2025`<br>_(SQL Server 2025 Standard)_ |
## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
