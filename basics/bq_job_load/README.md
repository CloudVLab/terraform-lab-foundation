# Terraform: BigQuery Job Load 

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Create a Google BigQuery Job Load based on a Terraform configuration

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

Qwiklabs Properties
__NOTE:__ Qwiklabs properties are mandatory. 
The mandatory values are used to initiate the project.

```
gcp_project_id       = var.gcp_project_id 
gcp_region           = var.gcp_region 
gcp_zone             = var.gcp_zone 
```

#### Custom Properties

```
bq_table_id       = "ttable"
bq_dataset_id     = "soccer"
bq_job_id         = "job1"
bq_job_source     = [ "gs://bucket/file" ]
bq_job_write      = "WRITE_APPEND"
bq_job_autodetect = true
bq_job_format     = "CSV" 
bq_job_skip_row   = 1
```


## Accessing Output Values 

| Field | Description |
|-------|-------------|


## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
