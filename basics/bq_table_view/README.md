# Terraform: BigQuery Table View

| Channel | Status |
|---------|--------|
| Stable  | TBC    | 
| Beta    | TBC    | 

Create a Google BigQuery Table based on a Terraform configuration

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
bq_table_id = "ttable"
bq_table_description = "This is an example table"
bq_dataset_id = "soccer"

## View configuration
bq_view_query        = "SELECT * FROM  `bigquery-public-data.utility_us.zipcode_area` WHERE  state_code = \"CA\"  ORDER BY area_land_miles ASC LIMIT 100 publicviews.myview"
bq_view_legacy_sql   = false
```


## Accessing Output Values 

| Field | Description |
|-------|-------------|


## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
