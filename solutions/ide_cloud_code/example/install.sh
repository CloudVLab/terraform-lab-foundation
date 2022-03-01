#!/bin/sh

DIRECTORY="tf"
FILE1="main.tf"
FILE1_URL="https://github.com/CloudVLab/terraform-lab-foundation/raw/main/solutions/ide_cloud_code/example/main.tf"
FILE2="outputs.tf"
FILE2_URL="https://github.com/CloudVLab/terraform-lab-foundation/raw/main/solutions/ide_cloud_code/example/outputs.tf"
FILE3="runtime.yaml"
FILE3_URL="https://github.com/CloudVLab/terraform-lab-foundation/raw/main/solutions/ide_cloud_code/example/runtime.yaml"
FILE4="variables.tf"
FILE4_URL="https://github.com/CloudVLab/terraform-lab-foundation/raw/main/solutions/ide_cloud_code/example/variables.tf"

# Create TF directory if not present
if [ ! -d $DIRECTORY ]; then
  mkdir $DIRECTORY 
fi

# Download if the file does not exist
if [ ! -f $DIRECTORY/$FILE1 ]; then
curl -LO $FILE1_URL -o "./$DIRECTORY/$FILE1"
fi 

## # Download if the file does not exist
## if [ ! -f $DIRECTORY/$FILE2 ]; then
## curl -LO $FILE2_URL -o $DIRECTORY/$FILE2
## fi
## 
## # Download if the file does not exist
## if [ ! -f $DIRECTORY/$FILE3 ]; then
## curl -LO $FILE3_URL -o $DIRECTORY/$FILE3
## fi
## 
## # Download if the file does not exist
## if [ ! -f $DIRECTORY/$FILE4 ]; then
## curl -LO $FILE4_URL -o $DIRECTORY/$FILE4
## fi
