# User Variables: Content author values
#-----------------------------------------------------------------------------

# Tag reference 
variable "tag" {
  type        = string
  description = "Tag reference"
}

# Question title 
variable "question" {
  type        = string
  description = "Question title"
}

# Question options - four items
variable "options" {
  type        = list(string)
  description = "Question options list"
}

# Question answer 
variable "answer" {
  type        = string
  description = "Question answer"
}

