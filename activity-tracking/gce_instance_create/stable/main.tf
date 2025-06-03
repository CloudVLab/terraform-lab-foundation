resource "local_file" "activity_tracking_step" {
  content = <<-EOF
# Objective: Verifies the creation of the bucket
def ${var.step_name}(handles:, maximum_score:, resources:)

  compute       = handles['project_0.ComputeV1']
  instance_name = resources['project_0']['startup_script.instance_name']
  zone          = resources['project_0']['default_zone']

  # Assessment score and status checker hash variable
  ret_hash = { :score => 0, :message => "", :student_message => ""}

  # Assessment specific variables
  isAvailable = false

  # Call the ComputeV1 API
  lab_instance = compute.get_instance(compute.project, zone, instance_name, freeze_args:true)

  # Save the API call result
  apiResponseName = lab_instance.name || []

  # Validate if the virtual machine is found
  if apiResponseName.include?(instance_name)
    isAvailable =  true
  end

  if isAvailable
    ret_hash = { :done => true, :score => maximum_score, :message => "Assessment completed!", :student_message => "Assessment completed!"}
  else
    error_message = 'Please create a GCE instance.'
    ret_hash[:message] = error_message
    ret_hash[:student_message] = error_message
  end

  return ret_hash
end
EOF
  filename = "${var.step_name}.rb"
}

