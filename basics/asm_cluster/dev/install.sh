#!/bin/bash

export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects list --filter="$(gcloud config get-value project)" --format="value(PROJECT_NUMBER)")
export ZONE=$(curl -X GET http://metadata.google.internal/computeMetadata/v1/instance/attributes/gcp_zone -H 'Metadata-Flavor: Google')
export GCP_USERNAME=$(curl -X GET http://metadata.google.internal/computeMetadata/v1/instance/attributes/gcp_username -H 'Metadata-Flavor: Google')
export CLUSTER_NAME=$(curl -X GET http://metadata.google.internal/computeMetadata/v1/instance/attributes/gke_cluster_name -H 'Metadata-Flavor: Google')
export ASM_VERSION=1.16
export KUBECONFIG=~/.kubeconfig

echo "Project ID=$PROJECT_ID, Project number=$PROJECT_NUMBER, ZONE=$ZONE, GCP_USERNAME=$GCP_USERNAME, CLUSTER_NAME=$CLUSTER_NAME, ASM_VERSION=$ASM_VERSION"

sudo apt-get install kubectl google-cloud-sdk-gke-gcloud-auth-plugin jq git -y

gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE --project $PROJECT_ID
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$GCP_USERNAME@qwiklabs.net

curl https://storage.googleapis.com/csm-artifacts/asm/asmcli_1.16 > asmcli
chmod +x asmcli
sudo install -o root -g root -m 0755 asmcli /usr/local/bin/asmcli

export SCRIPTPATH=$(dirname $(realpath $0))
cd $SCRIPTPATH
export WORK_DIR=$SCRIPTPATH

asmcli install \
  --project_id $PROJECT_ID \
  --cluster_name $CLUSTER_NAME \
  --cluster_location $ZONE \
  --fleet_id $PROJECT_ID \
  --output_dir ./asm_output \
  --enable_all \
  --option legacy-default-ingressgateway \
  --ca mesh_ca \
  --enable_gcp_components

echo "Enabling Sidecar Injection..."
kubectl label namespace default istio-injection=enabled --overwrite
