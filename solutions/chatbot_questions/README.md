# Terraform: Chatbot Questions 

Create a template for assessment questions 

## Using Input Values 

__NOTE:__ Qwiklabs requires some values to be defined as part of the provisioning process. 

```
lab_topic       = "my-topic"
lab_persona     = "my-name"
lab_context     = "my-context"
lab_list        = [ {"title": "title", "members": [ "item-1", "item-2", "item-3", "item-4" ]
```

## Accessing Output Values 

| Field | Description |
|-------|-------------|
| question | Return a value based on generated question information |

## Adding a Commit 

Commits to the repository will initiate the automated QA process.

It is highly recommended that modules are tested locally before making a commit.

## Request a Pull Request

__DO NOT__ raise a PR on code that does not pass integration tests.
