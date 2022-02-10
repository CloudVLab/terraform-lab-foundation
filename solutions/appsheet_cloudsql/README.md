# Terraform: AppSheet + Cloud SQL: MySQL v5.7 

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Create a Cloud SQL MySQL instance based on a Terraform configuration
The Cloud SQL instance has authorized networks for use with AppSheet.
A VM is used to populate a Cloud SQL database.
The configuration for the database is specified in the `scripts` folder.

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

#### Custom CloudSQL Properties

```bash
sql_user_name     = "lab_tester"
sql_db_name       = "appsheet" 
sql_db_version    = "MYSQL_5_7"
sql_user_host     = "%"
sql_user_password = "Password01" 
```

__NOTE:__ 
* Database is prefixed with the `project_id` to ensure they are globally unique.
* Ensure `sql_user_name` and `sql_user_password` are consistent in vm script configuration.

#### Custom VM Properties

If you require a database to be loaded, add the following configuration to preload a schema from Cloud Storage.
The VM include a basic bash script to authorize and load a custom configuration onto the Cloud SQL instance.


```bash
gce_name          = "mysql_admin"
gce_tags          = ["lab_vm"]
gce_machine_image = "debian-cloud/debian-10"
gce_machine_network = "default"
gce_scopes          = ["cloud-platform"]
gce_startup_script  = "${file("./scripts/lab-init")}" 
```

__NOTE:__ 
* The GCE instance is created post the Cloud SQL instance
* The GCE instance will communicate to Cloud SQL using the specified username and password (ensure these are correct in the script)
* The Cloud SQL authorized network will be reset by the GCE instance to include the GCE External IP
* The database to be loaded is specified in a public storage bucket within the script


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
