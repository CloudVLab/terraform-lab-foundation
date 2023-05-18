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
  - 'PROJECT_NUMBER=${_PROJECT_NUMBER}'
  - 'ZONE=${_ZONE}'
  - 'GCP_USERNAME=${_GCP_USERNAME}'
  - 'CLUSTER_NAME=${_CLUSTER_NAME}'
  - 'ASM_VERSION=${_ASM_VERSION}'
  - 'KUBECONFIG=${_KUBECONFIG}'
  - 'SA=${_SA}'
  script: |
    #!/bin/bash

    # apt-get update && apt-get install kubectl google-cloud-sdk-gke-gcloud-auth-plugin jq git netcat -y
    apt-get update && apt-get install kubectl jq git netcat -y
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE --project $PROJECT_ID
    kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$GCP_USERNAME@qwiklabs.net
    
    curl -L https://storage.googleapis.com/csm-artifacts/asm/asmcli_1.16 -o asmcli
    chmod +x asmcli
    mv asmcli /usr/local/bin/asmcli
    # install -o root -g root -m 0755 asmcli /usr/local/bin/asmcli
    
    # export SCRIPTPATH=$(dirname $(realpath $0))
    # cd $SCRIPTPATH
    # export WORK_DIR=$SCRIPTPATH

    asmcli install \
    --project_id $PROJECT_ID \
    --cluster_name $CLUSTER_NAME \
    --cluster_location $ZONE \
    --fleet_id $PROJECT_ID \
    --enable_all \
    --option legacy-default-ingressgateway \
    --ca mesh_ca \
    --service-account $SA \
    --enable_gcp_components
   
    echo "Enabling Sidecar Injection..."
    kubectl label namespace default istio-injection=enabled --overwrite
timeout: 900s
substitutions:
  _PROJECT_ID: project_id
  _PROJECT_NUMBER: project_number
  _ZONE: zone
  _GCP_USERNAME: gcp_username
  _CLUSTER_NAME: cluster_name
  _ASM_VERSION: '1.16'
  _KUBECONFIG: ~/.kubeconfig
  _SA: service_account 
options:
  substitution_option: 'ALLOW_LOOSE'
EOF

# Initiate CloudBuild Trigger 
gcloud builds submit --config=cloudbuild.yaml --project="$1" --substitutions=_PROJECT_ID="$1",_PROJECT_NUMBER="$2",_ZONE="$3",_GCP_USERNAME="$4",_CLUSTER_NAME="$5",_SA="$6"
