#!/bin/sh

DIRECTORY="tf"
FILE1="main.tf"
FILE1_URL="https://github.com/CloudVLab/terraform-lab-foundation/raw/main/basics/api_service/example/main.tf"
FILE2="runtime.yaml"
FILE2_URL="https://github.com/CloudVLab/terraform-lab-foundation/raw/main/basics/api_service/example/runtime.yaml"
FILE3="variables.tf"
FILE3_URL="https://github.com/CloudVLab/terraform-lab-foundation/raw/main/basics/api_service/example/variables.tf"

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
