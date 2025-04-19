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
module "persona_one" {
  # TODO: Move source to terraform-lab-foundations
  source = "github.com/CloudVLab/terraform-lab-foundation//solutions/list_persona/stable"

  # ... Persona Definition
  name        = "Didier"
  topic       = "Learning French"
  knowledge   = "French language" 
  role        = "I am a tutor" 
  messageText = "I can teach stuff"
  imageUrl    = "https://storage.googleapis.com/spls/my-image.png"
  time        = "1 Jan"
  endpoint    = "/v1/v1"
}
