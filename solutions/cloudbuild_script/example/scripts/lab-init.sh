#!/bin/bash

# Set the Platform Project
gcloud config set project "$1"

# Create CloudBuild script 
cat << 'EOF' > cloudbuild.yaml 
steps:
- id: startup_script 
  name: 'gcr.io/google.com/cloudsdktool/cloud-sdk'
  env:
  - 'PROJECT_ID=${_PROJECT_ID}'
  script: |
    #!/bin/bash

    ## SCRIPT START
    echo "Script for ${PROJECT_ID} - Replace with cool script"
    ## SCRIPT END 
   
timeout: 900s
substitutions:
  _PROJECT_ID: project_id
options:
  substitution_option: 'ALLOW_LOOSE'
EOF

# Initiate CloudBuild Trigger 
gcloud builds submit --config=cloudbuild.yaml --project="$1" --substitutions=_PROJECT_ID="$1"
