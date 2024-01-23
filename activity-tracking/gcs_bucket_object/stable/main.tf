resource "local_file" "activity_tracking_step" {
  content  = <<-EOF
# Check if a file has been uploaded to Cloud Storage bucket
def ${var.step_name}(handles:, maximum_score:, resources:)

  # Service handle initialization and status checker hash variable
  storage             = handles['project_0.StorageV1']
  desired_bucket_name = resources['project_0']['startup_script.gcp_storage_bucket']
  desired_object      = resources['project_0']['startup_script.gcp_storage_object']

  # Assessment score and status checker hash variable
  ret_hash = { :score => 0, :message => "", :student_message => "" }

  # Assessment specific variables
  isAvailable = false

  # API call to get the storage object
  begin
  result = storage.get_object(desired_bucket_name, desired_object, freeze_args:true)
  if result.to_json.include?('text/plain')
    isAvailable = true
  end
  rescue
    error_message = "Lab assessment incomplete, please try again."
  end
  if isAvailable 
     ret_hash = {:score => maximum_score, :message => 'success', :student_message=> 'success'}
  else
   error_message = "Lab assessment incomplete, please try again."
   ret_hash[:message] = error_message
   ret_hash[:student_message] = error_message
  end

  return ret_hash
end
EOF
  filename = "${var.step_name}.rb"
}

