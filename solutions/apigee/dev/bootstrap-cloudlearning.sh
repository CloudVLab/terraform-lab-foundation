#!/usr/bin/env bash
cd ~

# Helper functions for bootstrapping
function get_metadata_property() {
  attribute_name="$1";
  default_value="$2"
  ! attribute_value=$(curl -f -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/${attribute_name}" -H "Metadata-Flavor: Google")
  if [[ -z "${attribute_value}" ]] ; then
    echo "${default_value}"
    return
  fi
  echo "${attribute_value}"
}

function install_google_cloud_sdk() {
  version="${1}"; shift
  snap remove google-cloud-sdk
  snap remove google-cloud-cli
  tarball="google-cloud-cli-${version}-linux-x86_64.tar.gz"
  curl -s  -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${tarball}
  tar --overwrite -xzf "${tarball}" -C /
  chmod a+rwx -R /google-cloud-sdk
  pushd /google-cloud-sdk
  ./install.sh --quiet --path-update true
  source /google-cloud-sdk/path.bash.inc
  popd
}

function activate_service_account() {
  service_account_json="$1"
  # sometimes service account activation fails, so retry
  while true ; do
    set +e
    gcloud auth activate-service-account --key-file=<(echo "${service_account_json}")
    exit_code="$?"
    set -e
    if [[ "${exit_code}" == "0" ]] ; then
      break;
    fi
  done
}

function checkout_branch() {
  git_branch_desired="$1"
  git_branch_fallback="$2"

  git_branch="${git_branch_desired}"
  if [[ "$(git ls-remote origin "${git_branch}" | wc -l)" == "0" ]] ; then
    echo "WARNING: '${git_branch}' branch does not exist. Falling back to '${git_branch_fallback}' branch"
    git_branch="${git_branch_fallback}"
  fi

  git checkout "${git_branch}"
}

echo "*** Setting up parent project config ***"
export PARENT_PROJECT=$(get_metadata_property 'parentProject' "")
export PARENT_PROJECT_STORAGE_BUCKET=$(get_metadata_property 'parentProjectStorageBucket' "")
export PARENT_PROJECT_DNS_ZONE=$(get_metadata_property 'parentProjectDNSZone' "")
export PARENT_PROJECT_SVC_ACCOUNT_PASS=$(get_metadata_property 'parentProjectSvcAccountPass' "")
export PARENT_PROJECT_SVC_ACCOUNT_JSON=$(openssl aes-256-cbc -d -salt -pbkdf2 -pass "pass:${PARENT_PROJECT_SVC_ACCOUNT_PASS}" -in <(curl -o - -s https://storage.googleapis.com/${PARENT_PROJECT_STORAGE_BUCKET}/resources/svc.json.enc?$(date +%s)))
export PARENT_PROJECT_SOURCE_REPO=$(get_metadata_property 'parentProjectSourceRepo' "")
export PARENT_PROJECT_SOURCE_BRANCH=$(get_metadata_property 'parentProjectSourceBranch' "main")
export PARENT_PROJECT_LAB_DIR_NAME=$(get_metadata_property 'parentProjectLabDirName' "")
export PARENT_PROJECT_LAB_TYPE=$(get_metadata_property 'parentProjectLabType' "")

echo "*** Setting up child project config ***"
export CHILD_PROJECT=$(get_metadata_property 'childProject' "")
export CHILD_PROJECT_SVC_ACCOUNT_JSON=$(get_metadata_property 'childProjectSvcAccountJSON' "")
export CHILD_PROJECT_USERNAME=$(get_metadata_property 'childProjectUsername' "student")
export CHILD_PROJECT_ZONE=$(get_metadata_property 'childProjectZone' "us-west1-b")
export CHILD_PROJECT_REGION=$(get_metadata_property 'childProjectRegion' "us-west1")

echo "*** Setting up other config ***"
export ENV=$(get_metadata_property 'env' "test")
export GOOGLE_CLOUD_SDK_VERSION=$(get_metadata_property 'googleCloudSDKVersion' "388.0.0")
export HOME=/root

echo "*** Updating apt package list ***"
apt-get update

echo "*** Installing Google Cloud SDK (${GOOGLE_CLOUD_SDK_VERSION}) ***"
install_google_cloud_sdk "${GOOGLE_CLOUD_SDK_VERSION}"

echo "*** Activating parent project service account ***"
activate_service_account "${PARENT_PROJECT_SVC_ACCOUNT_JSON}"
export PARENT_PROJECT_SVC_ACCOUNT=$(gcloud config list account --format "value(core.account)")

echo "*** Activating child project service account ***"
activate_service_account "${CHILD_PROJECT_SVC_ACCOUNT_JSON}"
export CHILD_PROJECT_SVC_ACCOUNT=$(gcloud config list account --format "value(core.account)")

echo "*** Cloning deployment manager (${PARENT_PROJECT_SOURCE_BRANCH} branch) ***"
rm -rf "${PARENT_PROJECT_SOURCE_REPO}"
gcloud source repos clone "${PARENT_PROJECT_SOURCE_REPO}" --project="${PARENT_PROJECT}" --account="${PARENT_PROJECT_SVC_ACCOUNT}"
pushd "${PARENT_PROJECT_SOURCE_REPO}"
checkout_branch "${PARENT_PROJECT_SOURCE_BRANCH}" "main"
popd

echo "*** Creting main environment file ***"
cat << EOF > ~/env
BASEDIR="\$( cd "\$( dirname "\$0" )" && pwd )"
export PATH="${HOME}/${PARENT_PROJECT_SOURCE_REPO}/deployment-manager/bin:/snap/bin:\$PATH"
export HOME='${HOME}'
export CHILD_PROJECT='${CHILD_PROJECT}'
export CHILD_PROJECT_ZONE='${CHILD_PROJECT_ZONE}'
export CHILD_PROJECT_REGION='${CHILD_PROJECT_REGION}'
export CHILD_PROJECT_USERNAME='${CHILD_PROJECT_USERNAME}'
export CHILD_PROJECT_SVC_ACCOUNT='${CHILD_PROJECT_SVC_ACCOUNT}'
export CHILD_PROJECT_SVC_ACCOUNT_JSON='${CHILD_PROJECT_SVC_ACCOUNT_JSON}'
export PARENT_PROJECT='${PARENT_PROJECT}'
export PARENT_PROJECT_SVC_ACCOUNT='${PARENT_PROJECT_SVC_ACCOUNT}'
export PARENT_PROJECT_SOURCE_REPO='${PARENT_PROJECT_SOURCE_REPO}'
export PARENT_PROJECT_SOURCE_BRANCH='${PARENT_PROJECT_SOURCE_BRANCH}'
export PARENT_PROJECT_DNS_ZONE='${PARENT_PROJECT_DNS_ZONE}'
export PARENT_PROJECT_LAB_DIR_NAME='${PARENT_PROJECT_LAB_DIR_NAME}'
export PARENT_PROJECT_LAB_TYPE='${PARENT_PROJECT_LAB_TYPE}'
source "/google-cloud-sdk/path.bash.inc"
source "\$(which utils.sh)"
EOF

echo "*** Handing off deployment to dm.sh ***"
source ~/env
dm-cloudlearning.sh

#gsutil mb -l us-central1 gs://$DEVSHELL_PROJECT_ID/

#cat <<EOF > done.txt
#Finished provisioning!
#EOF
#gsutil cp done.txt gs://${PROJECT_ID}/done