resource "local_file" "activity_tracking_step" {
  content = <<-EOF
# Objective: Check if a log sink has been created
def ${var.step_name}(handles:, maximum_score:, resources:)

def step_one_check(handles:, maximum_score:, resources:)
  logging = handles['project_0.LoggingV2']

  # Assessment score and status checker hash variable
  ret_hash = {:score => 0, :message => "", :student_message=> "" }

  # Assessment specific variables
  lab_time = 5400
  lab_start_time = Time.at(Time.now.to_i - lab_time)

  ## Logs Explorer values

  # Filter based on Log Explorer values
  log_filters = [
    # Example: 
    # 'protoPayload.request.repository.cleanupPolicies.' + ar_repo_id + '.id="' + ar_repo_id + '"',
    # 'protoPayload.request.repository.cleanupPolicies.' + ar_repo_id + '.mostRecentVersions.keepCount="' + ar_repo_keep_count + '"'
  ]

  # Build log filter
  custom_filter = log_filters.join(" AND ")

  # List_log_entries_request_object
  list_log_entries_request_object = Google::Apis::LoggingV2::ListLogEntriesRequest.new

  # Parent resource to track
  list_log_entries_request_object.resource_names = ['projects/' + logging.project]

  list_log_entries_request_object.filter = custom_filter
  log_explorer_logs = logging.list_entry_log_entries(list_log_entries_request_object)&.entries || []

  # Validate if logs > 0 found
  if log_explorer_logs.count > 0
    ret_hash = {:score => maximum_score, :message => "Assessment Completed!", :student_message => "Assessment Completed!"}
  elsif log_explorer_logs.count == 0
    error_message = "ADD ERROR MESSAGE."
    ret_hash[:message] = error_message
    ret_hash[:student_message] = error_message
  end
  return ret_hash
end
EOF
  filename = "${var.step_name}.rb"
}

