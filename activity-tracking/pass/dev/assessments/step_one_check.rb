def step_one_check(handles:, maximum_score:, resources:)

  # Service handle initialization
  logging = handles['project_0.LoggingV2']

  # Set parameters
  val_param = { 
    :pass_message => "Congratulations", 
    :fail_message => "Hmm, not sure that is correct", 
    :points => maximum_score 
  }

  # Perform a check
  ret_hash = step_one_pass(logging, val_param)

  return ret_hash
end

def step_one_pass(logging, val_param)
  ret_hash = { :done => true, :score => val_param[:points], :message => val_param[:pass_message], :student_message => val_param[:pass_message] }

  return ret_hash
end
