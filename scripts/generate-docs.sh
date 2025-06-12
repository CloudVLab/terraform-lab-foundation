#!/bin/bash
set -e

DOC_FILE="README.md"

# Check if terraform-docs is installed
if ! command -v terraform-docs &> /dev/null; then
  echo "⚠️  terraform-docs is not installed. Skipping documentation generation."
  echo "👉 You can install it from https://terraform-docs.io/user-guide/installation/"
  exit 0
fi

echo "🔍 Searching for Terraform modules in */solutions/**/stable and */basics/**/stable..."

# Get absolute path to repo root
BASE_DIR=$(git rev-parse --show-toplevel)

# Find all 'stable' folders under solutions or basics
find "$BASE_DIR" -type d \( -path "*/solutions/*/stable" -o -path "*/basics/*/stable" \) | while read -r dir; do
  if compgen -G "$dir"/*.tf > /dev/null; then
    echo "📄 Generating $DOC_FILE in $dir"
    terraform-docs markdown table "$dir" > "$dir/$DOC_FILE"
  else
    echo "⚠️  Skipping $dir (no .tf files)"
  fi
done
