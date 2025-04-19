##-----------------------------------------------------------------------------
## 
module "persona_one" {
  # TODO: Move source to terraform-lab-foundations
  ## source = "github.com/CloudVLab/terraform-lab-foundation//solutions/set_persona/stable"
  source = "gcs::https://www.googleapis.com/storage/v1/terraform-lab-foundation/solutions/set_persona/stable"

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
