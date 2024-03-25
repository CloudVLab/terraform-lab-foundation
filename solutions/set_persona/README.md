# Terraform: List Persona 

Create a template for Persona Types
Persona types are the input for Chatbots

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
persona_name = "Mathilde"
persona_topic = "French"
persona_knowledge= "French"
persona_role = "tutor" 
persona_messageText = "I can help with French"
persona_imageUrl = "https://storage.googleapis.com/my-bucket/image.png"
persona_time = "22 March"
persona_endpoint = "/v1/v1"
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| persona | Return a value based on generated persona |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
