resource "local_file" "activity_tracking_step" {
  content = <<-EOF
# Objective: Check if a vpc has been defined within the project
def ${var.step_name}(handles:, maximum_score:, resources:)

  compute  = handles['project_0.ComputeV1']
  vpc_name = resources['project_0']['startup_script.vpc_network_name']

  # Assessment specific variables
  isAvailable = false

  # Assessment score and status checker hash variable
  ret_hash = { :score => 0, :message => "", :student_message => ""}

  # Check if the object exists
  resource_object = compute.get_network(vpc_name.to_s) || []

  # Validate object created
  if resource_object
    isAvailable = true
  end

  if isAvailable
    ret_hash = { :score => maximum_score, :message => "Assessment completed!", :student_message => "Assessment completed!"}
  else
    error_message = 'Please create a VPC network.'
    ret_hash[:message] = error_message
    ret_hash[:student_message] = error_message
  end
end
EOF
  filename = "${var.step_name}.rb"
}

