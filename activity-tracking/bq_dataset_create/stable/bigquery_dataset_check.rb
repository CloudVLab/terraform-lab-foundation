# Objective: Verifies the creation of the dataset 
def bigquery_dataset_check(handles:, maximum_score:, resources:)

  # Service handle initialization
  bigquery     = handles['project_0.BigqueryV2']
  dataset_name = resources['project_0']['startup_script.bq_dataset_name']

  # Assessment score and status checker hash variable
  ret_hash = { :score => 0, :message => "", :student_message => ""}

  # Assessment specific variables
  isAvailable = false

  # Get the object information 
  resource_object = bigquery.get_dataset(dataset_name.to_s) || []

  # Check the object exists 
  if resource_object 
    isAvailable = true
  end

  if isAvailable 
    ret_hash = { :done => true, :score => maximum_score, :message => "Assessment completed!", :student_message => "Assessment completed!"}
  else
    error_message = 'Please create the BigQuery dataset.'
    ret_hash[:message] = error_message
    ret_hash[:student_message] = error_message
  end

  return ret_hash
end
