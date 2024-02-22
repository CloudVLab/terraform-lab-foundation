resource "local_file" "activity_tracking_step" {
  content = <<-EOF
# Objective: Check if a firewall rule has been defined within the project
def ${var.step_name}(handles:, maximum_score:, resources:)

  compute           = handles['project_0.ComputeV1']
  fw_rule_name      = resources['project_0']['startup_script.fw_rule_name']
  fw_rule_direction = resources['project_0']['startup_script.fw_rule1_direction'].downcase

  # Assessment specific variables
  isAvailable = false

  # Assessment score and status checker hash variable
  ret_hash = { :score => 0, :message => "", :student_message => ""}

  # Get the object information
  resource_object = compute.get_firewall(fw_rule_name.to_s) || []

  # Check the object exists 
  if resource_object.direction.downcase.include?(fw_rule_direction)
    isAvailable = true
  end

  if isAvailable
    ret_hash = { :done => true, :score => maximum_score, :message => "Assessment completed!", :student_message => "Assessment completed!"}
  else
    error_message = 'Please create an ingress firewall rule.'
    ret_hash[:message] = error_message
    ret_hash[:student_message] = error_message
  end
  return ret_hash
end
EOF
  filename = "${var.step_name}.rb"
}

