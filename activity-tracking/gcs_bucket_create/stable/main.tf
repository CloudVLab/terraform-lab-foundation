resource "local_file" "activity_tracking_step" {
  content = <<-EOF
# Objective: Verifies the creation of the bucket
def ${var.step_name}(handles:, maximum_score:, resources:)

  storage     = handles['project_0.StorageV1']
  bucket_name = resources['project_0']['startup_script.bucket']

  # Assessment specific variables
  isAvailable = false

  # Assessment score and status checker hash variable
  ret_hash = { :score => 0, :message => "", :student_message => ""}

  # Get the object information 
  resource_object = storage.get_bucket(bucket_name.to_s) || []

  # Validate object exists 
  if resource_object
    isAvailable = true
  end

  if isAvailable
    ret_hash = { :score => maximum_score, :message => "Assessment completed!", :student_message => "Assessment completed!"}
  else
    error_message = 'Please create a storage bucket.'
    ret_hash[:message] = error_message
    ret_hash[:student_message] = error_message
  end
  return ret_hash
end
EOF
  filename = "${var.step_name}.rb"
}

