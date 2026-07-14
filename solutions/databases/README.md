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
| `mysql_5_7` | MySQL 5 7 database version details. | `MYSQL_5_7`<br>_(MySQL 5.7)_ | `MYSQL_5_7`<br>_(MySQL 5.7)_ | `MYSQL_5_7`<br>_(MySQL 5.7)_ |
| `mysql_8_0` | MySQL 8 0 database version details. | `MYSQL_8_0`<br>_(MySQL 8.0)_ | `MYSQL_8_0`<br>_(MySQL 8.0)_ | `MYSQL_8_0`<br>_(MySQL 8.0)_ |
| `mysql_8_0_40` | MySQL 8 0 40 database version details. | `MYSQL_8_0_40`<br>_(MySQL 8.0.40)_ | `MYSQL_8_0_40`<br>_(MySQL 8.0.40)_ | `MYSQL_8_0_40`<br>_(MySQL 8.0.40)_ |
| `postgres_12` | PostgreSQL 12 database version details. | `POSTGRES_12`<br>_(PostgreSQL 12)_ | `POSTGRES_12`<br>_(PostgreSQL 12)_ | `POSTGRES_12`<br>_(PostgreSQL 12)_ |
| `postgres_13` | PostgreSQL 13 database version details. | `POSTGRES_13`<br>_(PostgreSQL 13)_ | `POSTGRES_13`<br>_(PostgreSQL 13)_ | `POSTGRES_13`<br>_(PostgreSQL 13)_ |
| `postgres_14` | PostgreSQL 14 database version details. | `POSTGRES_14`<br>_(PostgreSQL 14)_ | `POSTGRES_14`<br>_(PostgreSQL 14)_ | `POSTGRES_14`<br>_(PostgreSQL 14)_ |
| `postgres_15` | PostgreSQL 15 database version details. | `POSTGRES_15`<br>_(PostgreSQL 15)_ | `POSTGRES_15`<br>_(PostgreSQL 15)_ | `POSTGRES_15`<br>_(PostgreSQL 15)_ |
| `postgres_16` | PostgreSQL 16 database version details. | `POSTGRES_16`<br>_(PostgreSQL 16)_ | `POSTGRES_16`<br>_(PostgreSQL 16)_ | `POSTGRES_16`<br>_(PostgreSQL 16)_ |
| `postgres_17` | PostgreSQL 17 database version details. | `POSTGRES_17`<br>_(PostgreSQL 17)_ | `POSTGRES_17`<br>_(PostgreSQL 17)_ | `POSTGRES_17`<br>_(PostgreSQL 17)_ |
| `sqlserver_2017_standard` | SQL Server 2017 Standard database version details. | `SQLSERVER_2017_STANDARD`<br>_(SQL Server 2017 Standard)_ | `SQLSERVER_2017_STANDARD`<br>_(SQL Server 2017 Standard)_ | `SQLSERVER_2017_STANDARD`<br>_(SQL Server 2017 Standard)_ |
| `sqlserver_2019_express` | SQL Server 2019 Express database version details. | `SQLSERVER_2019_EXPRESS`<br>_(SQL Server 2019 Express)_ | `SQLSERVER_2019_EXPRESS`<br>_(SQL Server 2019 Express)_ | `SQLSERVER_2019_EXPRESS`<br>_(SQL Server 2019 Express)_ |
| `sqlserver_2019_standard` | SQL Server 2019 Standard database version details. | `SQLSERVER_2019_STANDARD`<br>_(SQL Server 2019 Standard)_ | `SQLSERVER_2019_STANDARD`<br>_(SQL Server 2019 Standard)_ | `SQLSERVER_2019_STANDARD`<br>_(SQL Server 2019 Standard)_ |
## Adding a Commit

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
