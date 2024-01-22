#
# ------------------  Qwiklabs Values
#
variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "gcp_zone" {
  type = string
}

##-----------------------------------------------------------------------------
## 

## Lab Data List
variable "lab_topic" {
  type        = string
  description = "The topic area to be covered"
  default     = "French"
}

variable "lab_persona" {
  type        = string
  description = "Person to interact with in the chatbot"
  default     = "Mathilde"
}

variable "lab_context" {
  type        = string
  description = "Context of the lab"
  default     = "Vive la France"
}

## Type Constraint: Members == 4 | There are four options presented
## title: String representing the title of the List e.g. "History, Geography, Artists"
## members: List of Strings, separate each item with a comma e.g. "Paris", "Napoleon"

variable "lab_list" {
  type = list(object({
    title = string
    members = list(string)
  }))
  default = [
    {
      "title" = "French Monarchs"
      "members" = [
        "Louis XIV",
        "Louis XV",
        "Louis XVI",
        "Marie Antoinette",
      ]
    },
    {
      "title" = "Regions of France"
      "members" = [
        "Brittany",
        "Corsica",
        "Nouvelle-Aquitaine",
        "Paris",
      ]
    },
    {
      "title" = "French Artists"
      "members" = [
        "Claude Monet",
        "Vincent van Gogh",
        "Paul Cézanne",
        "Henri Matisse",
      ]
    },
    {
      "title" = "French Celebrities"
      "members" = [
        "Napoleon Bonaparte",
        "Marie Curie",
        "Jean Reno",
        "Edith Piaf",
      ]
    }
  ]
}


## Task information
variable tasks {
  type = list(object({
    tag      = string
    question = string
    option_a = string
    option_b = string
    option_c = string
    option_d = string
  }))

  default = [
    {
      tag      = "Add a Task and number"
      question = "Add a question"
      option_a = "Add an option"
      option_b = "Add an option"
      option_c = "Add an option"
      option_d = "Add an option"
    }
  ]
}
