# solutions/databases/dev/outputs.tf

output "db_versions" {
  description = "A map of all configured database versions."
  value       = local.databases
}

output "mysql" {
  description = "MySQL database details."
  value       = local.databases.mysql
}

output "postgres" {
  description = "PostgreSQL database details."
  value       = local.databases.postgres
}

output "sqlserver_standard" {
  description = "SQL Server Standard Edition database details."
  value       = local.databases.sqlserver_standard
}

output "sqlserver_enterprise" {
  description = "SQL Server Enterprise Edition database details."
  value       = local.databases.sqlserver_enterprise
}

output "sqlserver_express" {
  description = "SQL Server Express Edition database details."
  value       = local.databases.sqlserver_express
}
