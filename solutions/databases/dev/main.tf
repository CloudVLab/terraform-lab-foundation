# solutions/databases/dev/main.tf
locals {
  databases = {
    mysql = {
      name    = "MySQL 8.4"
      id_long = "MYSQL_8_4"
      version = "8.4"
    }
    postgres = {
      name = "PostgreSQL 16"
      id_long = "POSTGRES_16"
      version = "16"
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
