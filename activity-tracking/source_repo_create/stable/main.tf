resource "local_file" "activity_tracking_step" {
  content = <<-EOF
# Objective: Verifies the creation of the bucket
def ${var.step_name}(handles:, maximum_score:, resources:)

  # Service handle initialization
  sourcerepo = handles['project_0.SourcerepoV1']
  project_id = resources['project_0']['project_id']
  repo_name  = 'projects/' + resources['project_0']['project_id'] + '/repos/' + resources['project_0']['startup_script.source_repo_name']

  # Assessment score and status checker hash variable
  ret_hash = { :score => 0, :message => "", :student_message => ""}

  # Assessment specific variables
  isAvailable = false

  # Method: get project repo returns an object
  repo = sourcerepo.get_project_repo(repo_name.to_s) || []

  # Check if the object exists
  if repo
    isAvailable = true
  end

  if isAvailable 
    ret_hash = { :score => maximum_score, :message => "Assessment completed!", :student_message => "Assessment completed!"}
  else
    error_message = 'Please create the source repository.'
    ret_hash[:message] = error_message
    ret_hash[:student_message] = error_message
  end

end
EOF
  filename = "${var.step_name}.rb"
}

