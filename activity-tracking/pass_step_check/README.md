# Pass

Enables `pass` functionality within a lab.

## Use Case: Pass Activity Tracking

* Problem: I want to include activity tracking functionality
* Solution: Include a `pass` placeholder within a lab. When the user clicks on the activity tracking it will turn green to mimic a pass.
* Discussion: The code linked below provides an example setup.

```ruby
  # Set defaults to variables
  ret_hash = { :done => true, :score => val_param[:points], :message => val_param[:pass_message], :student_message => val_param[:pass_message] }
```

## Googleapi 

-[ ] N/A 

