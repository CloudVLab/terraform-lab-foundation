# solutions/databases/preview/main.tf
locals {
  databases = {
    mysql = {
      name    = "MySQL 8.4"
      id_long = "MYSQL_8_4"
      version = "8.4"
    }
    postgres = {
      name = "PostgreSQL 15"
      id_long = "POSTGRES_15"
      version = "15"
    }
    sqlserver_standard = {
      name = "SQL Server 2025 Standard"
      id_long = "SQLSERVER_2025_STANDARD"
      version = "2025"
    }
    sqlserver_enterprise = {
      name = "SQL Server 2025 Enterprise"
      id_long = "SQLSERVER_2025_ENTERPRISE"
      version = "2025"
    }
    sqlserver_express = {
      name = "SQL Server 2025 Express"
      id_long = "SQLSERVER_2025_EXPRESS"
      version = "2025"
    }
  }
}