# solutions/databases/stable/outputs.tf

output "db_versions" {
  description = "A map of all configured database versions."
  value       = local.db_versions
}

output "mysql_5_7" {
  description = "MySQL 5.7 database version details."
  value       = local.db_versions.mysql_5_7
}

output "mysql_8_0" {
  description = "MySQL 8.0 database version details."
  value       = local.db_versions.mysql_8_0
}

output "mysql_8_0_40" {
  description = "MySQL 8.0.40 database version details."
  value       = local.db_versions.mysql_8_0_40
}

output "postgres_12" {
  description = "PostgreSQL 12 database version details."
  value       = local.db_versions.postgres_12
}

output "postgres_13" {
  description = "PostgreSQL 13 database version details."
  value       = local.db_versions.postgres_13
}

output "postgres_14" {
  description = "PostgreSQL 14 database version details."
  value       = local.db_versions.postgres_14
}

output "postgres_15" {
  description = "PostgreSQL 15 database version details."
  value       = local.db_versions.postgres_15
}

output "postgres_16" {
  description = "PostgreSQL 16 database version details."
  value       = local.db_versions.postgres_16
}

output "postgres_17" {
  description = "PostgreSQL 17 database version details."
  value       = local.db_versions.postgres_17
}

output "sqlserver_2017_standard" {
  description = "SQL Server 2017 Standard database version details."
  value       = local.db_versions.sqlserver_2017_standard
}

output "sqlserver_2019_standard" {
  description = "SQL Server 2019 Standard database version details."
  value       = local.db_versions.sqlserver_2019_standard
}

output "sqlserver_2019_express" {
  description = "SQL Server 2019 Express database version details."
  value       = local.db_versions.sqlserver_2019_express
}
