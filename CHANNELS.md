# Channels

Release schedule for the supported channels:

| Channel | Audience | Updates   | branch | Description |
|---------|----------|-----------|--------|-------------|
| Stable  | Prod     | Monthly   | main | Use this for the most stable versions of scripts |
| Beta    | QA       | Weekly    | test | Use this for the beta access to code updates |
| Dev     | Dev      | Nightly   | *    | Use this to develop new Terraform building blocks and solutions | 

A continuous integration workflow is used to automatically update the Stable/Beta channels.
The current state of the Stable/Beta branches are represented by a status badge.

## Stable

![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=2585d58a-918e-4bf1-b4de-e1c3a2ed949c)

Stable channel code will use the [modules]/stable folder.

| Local | Staging | Production |
|-------|---------|------------|
| Yes   | Yes     | Yes        |

* Most users will want to use this channel.
* Published labs should use this channel
* Changes are made in line with Terraform app + Provider updates.

The expected hierarchy for Stable channel code submissions is presented below:

```
.
├── main.tf
├── modules
│   ├── stable 
│   ├── beta 
│   └── dev 
├── outputs.tf
├── runtime.yaml
└── variables.tf
```

__Merging directly to the main branch is prohibited.__


## Beta 

![CloudBuild](https://badger-kjyo252taq-uc.a.run.app/build/status?project=qwiklabs-resources&id=878a4ae2-099c-4458-a575-f0be99a621aa)

Beta channel code will use the modules/beta folder.

| Local | Staging | Production |
|-------|---------|------------|
| Yes   | Yes     | No         |

* Use this channel where new functionality (lacking in stable) is desired
* Labs should __NOT__ be published to production when using this channel

Commits to the Beta channel are automatically submitted for integration tests.
Only code passing integration tests are eligible for merging.

The expected hierarchy for Beta channel code submissions is presented below:

```
.
├── main.tf
├── modules
│   ├── beta
│   └── dev 
├── outputs.tf
├── runtime.yaml
└── variables.tf
```

__Merging directly to the test branch is prohibited.__

__Raise a PR for code review and merge.__ 


## Dev 


Dev channel code should use the modules/dev folder.

| Local | Staging | Production |
|-------|---------|------------|
| Yes   | Yes     | No         |

* Use this channel to develop a new solution
* Use this channel to enhance a building block
* Labs should __NOT__ be published beyond staging using this channel

The expected hierarchy for Dev channel code submissions is presented below:

```
.
├── main.tf
├── modules
│   └── dev 
├── outputs.tf
├── runtime.yaml
└── variables.tf
```
