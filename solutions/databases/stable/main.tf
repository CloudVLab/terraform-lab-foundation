# solutions/databases/stable/main.tf
locals {
  db_versions = {
    mysql_5_7 = {
      name    = "MySQL 5.7"
      version = "MYSQL_5_7"
    }
    mysql_8_0 = {
      name    = "MySQL 8.0"
      version = "MYSQL_8_0"
    }
    mysql_8_0_40 = {
      name    = "MySQL 8.0.40"
      version = "MYSQL_8_0_40"
    }
    postgres_12 = {
      name    = "PostgreSQL 12"
      version = "POSTGRES_12"
    }
    postgres_13 = {
      name    = "PostgreSQL 13"
      version = "POSTGRES_13"
    }
    postgres_14 = {
      name    = "PostgreSQL 14"
      version = "POSTGRES_14"
    }
    postgres_15 = {
      name    = "PostgreSQL 15"
      version = "POSTGRES_15"
    }
    postgres_16 = {
      name    = "PostgreSQL 16"
      version = "POSTGRES_16"
    }
    postgres_17 = {
      name    = "PostgreSQL 17"
      version = "POSTGRES_17"
    }
    sqlserver_2017_standard = {
      name    = "SQL Server 2017 Standard"
      version = "SQLSERVER_2017_STANDARD"
    }
    sqlserver_2019_standard = {
      name    = "SQL Server 2019 Standard"
      version = "SQLSERVER_2019_STANDARD"
    }
    sqlserver_2019_express = {
      name    = "SQL Server 2019 Express"
      version = "SQLSERVER_2019_EXPRESS"
    }
  }
}
