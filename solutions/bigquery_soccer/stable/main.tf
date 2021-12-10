# BigQuery Terraform Template

# Create a Dataset
resource "google_bigquery_dataset" "default" {
  dataset_id                  = "soccer"
  friendly_name               = "BigQuery soccer dataset"
  description                 = "Soccer dataset for sports analysis"
  location                    = "US"
  default_table_expiration_ms = 3600000

  labels = {
    env = "prod"
  }
}

#-----------------------------------------------------------------------------
# Introduce a delay
resource "time_sleep" "table1_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "10s"
}

resource "time_sleep" "job1_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "10s"
}

# Create a new BQ Table: competitions
resource "google_bigquery_table" "competitions" {
  deletion_protection = false
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "competitions"
  description = "Soccer competitions"

  depends_on = [ google_bigquery_dataset.default, time_sleep.table1_wait_10_seconds ]
  # depends_on = [ google_bigquery_dataset.default ]
}

# BQ Job to load data from Cloud Storage
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_job
resource "google_bigquery_job" "job1" {
  job_id     = "job_load_1"

  labels = {
    "my_job" ="load_competitions"
  }

  load {
    source_uris = [
      "gs://spls/bq-soccer-analytics/competitions.json",
    ]

    destination_table {
      project_id = var.gcp_project_id 
      dataset_id = google_bigquery_dataset.default.dataset_id
      table_id   = google_bigquery_table.competitions.table_id
    }

    #skip_leading_rows = 1
    schema_update_options = ["ALLOW_FIELD_RELAXATION", "ALLOW_FIELD_ADDITION"]
    write_disposition = "WRITE_APPEND"
    #write_disposition = "WRITE_TRUNCATE"
    source_format = "NEWLINE_DELIMITED_JSON"
    autodetect = true
  }

  depends_on = [ google_bigquery_table.competitions, time_sleep.job1_wait_10_seconds ]
}


#-----------------------------------------------------------------------------

# Introduce a delay
resource "time_sleep" "table2_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "15s"
}

resource "time_sleep" "job2_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "10s"
}

# Create a new BQ Table
resource "google_bigquery_table" "matches" {
  deletion_protection = false
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "matches"
  description = "Soccer matches"
  depends_on = [ google_bigquery_dataset.default, time_sleep.table2_wait_10_seconds ]
}

# Run a BQ Job to load data from Cloud Storage
resource "google_bigquery_job" "job2" {
  job_id     = "job_load_2"

  labels = {
    "my_job" ="load_matches"
  }

  load {
    source_uris = [
      "gs://spls/bq-soccer-analytics/matches.json",
    ]

    destination_table {
      project_id = var.gcp_project_id 
      dataset_id = google_bigquery_dataset.default.dataset_id
      table_id   = google_bigquery_table.matches.table_id
    }

    #skip_leading_rows = 1
    schema_update_options = ["ALLOW_FIELD_RELAXATION", "ALLOW_FIELD_ADDITION"]
    write_disposition = "WRITE_APPEND"
    #write_disposition = "WRITE_TRUNCATE"
    source_format = "NEWLINE_DELIMITED_JSON"
    autodetect = true
  }
  depends_on = [ google_bigquery_table.matches, time_sleep.job2_wait_10_seconds ]
}

#-----------------------------------------------------------------------------
# Introduce a delay
resource "time_sleep" "table3_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "20s"
}

resource "time_sleep" "job3_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "10s"
}

# Create a new BQ Table
resource "google_bigquery_table" "teams" {
  deletion_protection = false
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "teams"
  description = "Soccer teams"
  depends_on = [ google_bigquery_dataset.default, time_sleep.table3_wait_10_seconds ]
  # depends_on = [ google_bigquery_dataset.default, google_bigquery_table.matches ]
}

# Run a BQ Job to load data from Cloud Storage
resource "google_bigquery_job" "job3" {
  job_id     = "job_load_3"

  labels = {
    "my_job" ="load_teams"
  }

  load {
    source_uris = [
      "gs://spls/bq-soccer-analytics/teams.json",
    ]

    destination_table {
      project_id = var.gcp_project_id 
      dataset_id = google_bigquery_dataset.default.dataset_id
      table_id   = google_bigquery_table.teams.table_id
    }

    #skip_leading_rows = 1
    schema_update_options = ["ALLOW_FIELD_RELAXATION", "ALLOW_FIELD_ADDITION"]
    write_disposition = "WRITE_APPEND"
    #write_disposition = "WRITE_TRUNCATE"
    source_format = "NEWLINE_DELIMITED_JSON"
    autodetect = true
  }
  depends_on = [ google_bigquery_table.teams, time_sleep.job3_wait_10_seconds ]
}

#-----------------------------------------------------------------------------
# Introduce a delay
resource "time_sleep" "table4_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "25s"
}

resource "time_sleep" "job4_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "10s"
}

# Create a new BQ Table
resource "google_bigquery_table" "players" {
  deletion_protection = false
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "players"
  description = "Soccer players"
  depends_on = [ google_bigquery_dataset.default, time_sleep.table4_wait_10_seconds ]
  # depends_on = [ google_bigquery_dataset.default, google_bigquery_table.teams ]
}

# Run a BQ Job to load data from Cloud Storage
resource "google_bigquery_job" "job4" {
  job_id     = "job_load_4"

  labels = {
    "my_job" ="load_players"
  }

  load {
    source_uris = [
      "gs://spls/bq-soccer-analytics/players.json",
    ]

    destination_table {
      project_id = var.gcp_project_id 
      dataset_id = google_bigquery_dataset.default.dataset_id
      table_id   = google_bigquery_table.players.table_id
    }

    #skip_leading_rows = 1
    schema_update_options = ["ALLOW_FIELD_RELAXATION", "ALLOW_FIELD_ADDITION"]
    write_disposition = "WRITE_APPEND"
    #write_disposition = "WRITE_TRUNCATE"
    source_format = "NEWLINE_DELIMITED_JSON"
    autodetect = true
  }
  depends_on = [ google_bigquery_table.players, time_sleep.job4_wait_10_seconds ]
}

#-----------------------------------------------------------------------------
# Introduce a delay
resource "time_sleep" "table5_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "30s"
}

resource "time_sleep" "job5_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "10s"
}

# Create a new BQ Table
resource "google_bigquery_table" "events" {
  deletion_protection = false
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "events"
  description = "Soccer events"
  depends_on = [ google_bigquery_dataset.default, time_sleep.table5_wait_10_seconds ]
  # depends_on = [ google_bigquery_dataset.default, google_bigquery_table.players ]
}

# Run a BQ Job to load data from Cloud Storage
resource "google_bigquery_job" "job5" {
  job_id     = "job_load_5"

  labels = {
    "my_job" ="load_events"
  }

  load {
    source_uris = [
      "gs://spls/bq-soccer-analytics/events.json",
    ]

    destination_table {
      project_id = var.gcp_project_id 
      dataset_id = google_bigquery_dataset.default.dataset_id
      table_id   = google_bigquery_table.events.table_id
    }

    #skip_leading_rows = 1
    schema_update_options = ["ALLOW_FIELD_RELAXATION", "ALLOW_FIELD_ADDITION"]
    write_disposition = "WRITE_APPEND"
    #write_disposition = "WRITE_TRUNCATE"
    source_format = "NEWLINE_DELIMITED_JSON"
    autodetect = true
  }
  depends_on = [ google_bigquery_table.events, time_sleep.job5_wait_10_seconds ]
}

#-----------------------------------------------------------------------------
# Introduce a delay
resource "time_sleep" "table6_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "35s"
}

resource "time_sleep" "job6_wait_10_seconds" {
  # depends_on = [null_resource.previous]

  create_duration = "10s"
}

# Create a new BQ Table
resource "google_bigquery_table" "tags2name" {
  deletion_protection = false
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = "tags2name"
  description = "Soccer metadata"
  depends_on = [ google_bigquery_dataset.default, time_sleep.table6_wait_10_seconds ]
  # depends_on = [ google_bigquery_dataset.default, google_bigquery_table.events ]
}

# Run a BQ Job to load data from Cloud Storage
resource "google_bigquery_job" "job6" {
  job_id     = "job_load_6"

  labels = {
    "my_job" ="load_tags2name"
  }

  load {
    source_uris = [
      "gs://spls/bq-soccer-analytics/tags2name.csv",
    ]

    destination_table {
      project_id = var.gcp_project_id 
      dataset_id = google_bigquery_dataset.default.dataset_id
      table_id   = google_bigquery_table.tags2name.table_id
    }

    skip_leading_rows = 1
    schema_update_options = ["ALLOW_FIELD_RELAXATION", "ALLOW_FIELD_ADDITION"]
    write_disposition = "WRITE_APPEND"
    #write_disposition = "WRITE_TRUNCATE"
    source_format = "CSV"
    autodetect = true
  }
  depends_on = [ google_bigquery_table.tags2name, time_sleep.job6_wait_10_seconds ]
}
