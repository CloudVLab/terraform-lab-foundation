resource "local_file" "activity_tracking_step" {
  content = <<-EOF
def ${var.step_name}(handles:, maximum_score:, resources:)

  # Set parameters
  val_param = {
    :pass_message => "Congratulations",
    :fail_message => "Hmm, not sure that is correct",
    :points => maximum_score
  }

  # Set defaults to variables
  ret_hash = { :done => true, :score => val_param[:points], :message => val_param[:pass_message], :student_message => val_param[:pass_message] }

  return ret_hash
end
EOF
  filename = "${var.step_name}.rb" 
}
