#!/bin/sh

BRANCH="main"
MODULE="cloud_code_developer"
URL="https://storage.googleapis.com/terraform-lab-foundation"
#URL="https://github.com/CloudVLab/terraform-lab-foundation/raw/${BRANCH}"

DIRECTORY="tf"
FILE1="main.tf"
FILE1_URL="${URL}/solutions/${MODULE}/example/main.tf"
FILE2="outputs.tf"
FILE2_URL="${URL}/solutions/${MODULE}/example/outputs.tf"
FILE3="runtime.yaml"
FILE3_URL="${URL}/solutions/${MODULE}/example/runtime.yaml"
FILE4="variables.tf"
FILE4_URL="${URL}/solutions/${MODULE}/example/variables.tf"

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
