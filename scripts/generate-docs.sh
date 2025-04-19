#!/bin/bash
set -e

echo "Running terraform-docs for each stable module..."

# Loop through all stable folders that contain .tf files
find root/solutions -type d -path "*/stable" | while read -r dir; do
  if compgen -G "$dir/*.tf" > /dev/null; then
    echo "Generating TERRAFORM.md in $dir"
    terraform-docs markdown table "$dir" > "$dir/TERRAFORM.md"
  fi
done
