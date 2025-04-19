# Terraform: List Persona 

Create a template for Persona Types
Persona types are the input for Chatbots

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```json
{
  "name": "Mathilde"
  "topic": "French"
  "knowledge": "French"
  "role":  "tutor" 
  "messageText": "I can help with French"
  "imageUrl":  "https://storage.googleapis.com/my-bucket/image.png"
  "time":  "22 March"
  "endpoint": "/v1/v1"
}
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
