# Qwiklabs Mandatory Values
variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "gcp_zone" {
  type = string
}

#
# Most Played Variables
##------------------------------------------------------------
#
variable "collection_most_played" {
  type = string
  default = "most_played"
}

variable "document_pop" {
  type = string
  default = "pop"
}

variable "document_rock" {
  type = string
  default = "rock"
}

variable "document_classical" {
  type = string
  default = "classical"
}

variable "mp_data_pop" {
  default = {
    "composer"= {
       "stringValue"= "Wiz Khalifa"
    },
    "title"= {
       "stringValue"= "See You Soon"
    }
  }
}

variable "mp_data_rock" {
  default = {
    "composer"= {
       "stringValue"= "Led Zeppelin"
    },
    "title"= {
       "stringValue"= "Stairway to Heaven"
    }
  }
}

variable "mp_data_classical" {
  default = {
    "composer"= {
       "stringValue"= "Wolfgang Mozart"
    },
    "title"= {
       "stringValue"= "Serenade No 13 for strings in G major"
    }
  }
}

#
# Accounts Variables
##------------------------------------------------------------
#
variable "collection_accounts" {
  type = string
  default = "accounts"
}

variable "document_415" {
  type = string
  default = "4155551212"
}

variable "document_925" {
  type = string
  default = "9255551212"
}

variable "document_650" {
  type = string
  default = "6505551212"
}

variable "ac_data_415" {
  default = {
    "first_name"= {
       "stringValue"= "Nozomi"
    },
    "last_name"= {
       "stringValue"= "Hernandez"
    }
    "pin"= {
       "stringValue"= "1111"
    }
    "tier"= {
       "stringValue"= "platinum"
    }
  }
}

variable "ac_data_925" {
  default = {
    "first_name"= {
       "stringValue"= "Mohammed"
    },
    "last_name"= {
       "stringValue"= "Devi"
    }
    "pin"= {
       "stringValue"= "2222"
    }
    "tier"= {
       "stringValue"= "gold"
    }
  }
}

variable "ac_data_650" {
  default = {
    "first_name"= {
       "stringValue"= "Chitra"
    },
    "last_name"= {
       "stringValue"= "Wang"
    }
    "pin"= {
       "stringValue"= "3333"
    }
    "tier"= {
       "stringValue"= "silver"
    }
  }
}

#
# Cloud Function Variables
##------------------------------------------------------------
#

variable "function_1_zip" {
  type    = string
  default = "mostplayed.zip"
}

variable "function_1_source" {
  type    = string
  default = "./cf/mostplayed.zip"
}

variable "function_2_zip" {
  type    = string
  default = "mostplayed.zip"
}

variable "function_2_source" {
  type    = string
  default = "./cf/account.zip"
}
