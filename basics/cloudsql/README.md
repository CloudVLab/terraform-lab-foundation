# Terraform: Cloud SQL

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Create a Cloud SQL MySQL instance based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

Qwiklabs Properties
__NOTE:__ Qwiklabs properties are mandatory. 
The mandatory values are used to initiate the project.
```bash
gcp_project_id       = "my-gcp-project"
gcp_region           = "us-central1"
gcp_zone             = "us-central1-a"
```

#### Custom Properties

```bash
sql_user_name     = "lab_tester"
sql_db_name       = "appsheet" 
sql_db_version    = "MYSQL_5_7"
sql_user_host     = "%"
sql_user_password = "Password01" 
```

__NOTE:__ Database is prefixed with the `project_id` to ensure they are globally unique.

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| cloud_sql_private_ip | The private ip of the database instance |
| cloud_sql_public_ip  | The public ip of the database instance |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
