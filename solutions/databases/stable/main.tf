# solutions/databases/stable/main.tf
locals {
  databases = {
    mysql = {
      name    = "MySQL 8.0"
      id_long = "MYSQL_8_0"
      version = "8.0"
    }
    postgres = {
      name = "PostgreSQL 14"
      id_long = "POSTGRES_14"
      version = "14"
    }
    sqlserver_standard = {
      name = "SQL Server 2022 Standard"
      id_long = "SQLSERVER_2022_STANDARD"
      version = "2022"
    }
    sqlserver_enterprise = {
      name = "SQL Server 2022 Enterprise"
      id_long = "SQLSERVER_2022_ENTERPRISE"
      version = "2022"
    }
    sqlserver_express = {
      name = "SQL Server 2022 Express"
      id_long = "SQLSERVER_2022_EXPRESS"
      version = "2022"
    }
  }
}