#!/bin/sh
BRANCH="main"
MODULE="cloudbuild_script"
TYPE="solutions"
CHANNEL="STABLE"

# Set the endpoint for the module
if [ "$CHANNEL" = "STABLE" ]; then
  ## STABLE Channel
  URL="https://github.com/CloudVLab/terraform-lab-foundation/raw/${BRANCH}"
else
  ## DEV/BETA Channel
  URL="https://github.com/CloudVLab/terraform-lab-foundation/raw/${BRANCH}"
fi 

DIRECTORY="tf"
FILE1="main.tf"
FILE1_URL="${URL}/${TYPE}/${MODULE}/example/main.tf"
FILE2="outputs.tf"
FILE2_URL="${URL}/${TYPE}/${MODULE}/example/outputs.tf"
FILE3="runtime.yaml"
FILE3_URL="${URL}/${TYPE}/${MODULE}/example/runtime.yaml"
FILE4="variables.tf"
FILE4_URL="${URL}/${TYPE}/${MODULE}/example/variables.tf"

# Create TF directory if not present
if [ ! -d $DIRECTORY ]; then
  mkdir $DIRECTORY 
fi

# Download if the file does not exist
if [ ! -f $DIRECTORY/$FILE1 ]; then
curl -L $FILE1_URL -o "$DIRECTORY/$FILE1"
fi 

# Download if the file does not exist
if [ ! -f $DIRECTORY/$FILE2 ]; then
curl -L $FILE2_URL -o "$DIRECTORY/$FILE2"
fi

# Download if the file does not exist
if [ ! -f $DIRECTORY/$FILE3 ]; then
curl -L $FILE3_URL -o "$DIRECTORY/$FILE3"
fi

# Download if the file does not exist
if [ ! -f $DIRECTORY/$FILE4 ]; then
curl -L $FILE4_URL -o "$DIRECTORY/$FILE4"
fi


## ---------------------------------------------------------------------------
## Scripts Directory

SCRIPTS="tf/scripts"
SCRIPT="lab-init.sh"
SCRIPT_URL="${URL}/${TYPE}/${MODULE}/example/scripts/${SCRIPT}"

# Create TF directory if not present
if [ ! -d "$SCRIPTS" ]; then
    mkdir -p $SCRIPTS
fi

# Download if the file does not exist
if [ ! -f "$SCRIPTS/$SCRIPT" ]; then
  curl -L $SCRIPT_URL -o "$SCRIPTS/$SCRIPT"
fi
