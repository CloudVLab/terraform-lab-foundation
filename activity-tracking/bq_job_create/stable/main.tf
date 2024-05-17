resource "local_file" "activity_tracking_step" {
  content = <<-EOF
# Objective: Verifies the creation of the table 
def ${var.step_name}(handles:, maximum_score:, resources:)

  # Service handle initialization
  bigquery  = handles['project_0.BigqueryV2']
  sub_query = resources['project_0']['startup_script.bq_job_query']

  # Assessment score and status checker hash variable
  ret_hash = { :score => 0, :message => "", :student_message => ""}

  # Assessment specific variables
  isAvailable = false

  # API call to list available BQ jobs
  jobs = bigquery.list_jobs(all_users: true)&.jobs || []

  isAvailable = jobs.any? do |job|
    next unless job&.status&.state == 'DONE'
    job_query = bigquery.get_job(job.job_reference.job_id)&.configuration&.query&.query
    job_query&.include?(sub_query)
  end

  if isAvailable 
    ret_hash = { :done => true, :score => maximum_score, :message => "Assessment completed!", :student_message => "Assessment completed!"}
  else
    error_message = 'Please create the BigQuery job.'
    ret_hash[:message] = error_message
    ret_hash[:student_message] = error_message
  end

  return ret_hash
end
EOF
  filename = "${var.step_name}.rb"
}

