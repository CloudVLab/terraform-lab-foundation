resource "local_file" "activity_tracking_step" {
  content = <<-EOF
# Objective: Check if the Pubsub Topic exists
def ${var.step_name}(handles:, maximum_score:, resources:)

  pubsub     = handles['project_0.PubsubV1']
  topic_name = 'projects/' + pubsub.project + '/topics/' + resources['project_0']['startup_script.pubsub_topic_name']

  # Assessment specific variables
  isAvailable = false

  # Assessment score and status checker hash variable
  ret_hash = { :score => 0, :message => "", :student_message => ""}

  # Get the object information
  resource_object = pubsub.get_topic(topic_name.to_s) || []

  # Check the object exists 
  if resource_object
    isAvailable = true
  end

  if isAvailable
    ret_hash = { :score => maximum_score, :message => "Assessment completed!", :student_message => "Assessment completed!"}
  else
    error_message = 'Please create a PubSub Topic.'
    ret_hash[:message] = error_message
    ret_hash[:student_message] = error_message
  end
  return ret_hash
end
EOF
  filename = "${var.step_name}.rb"
}

