
#!/usr/bin/env bash

# Stop the script if a command fails
set -euo pipefail

# Check that a Terraform directory was provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <terraform-directory>"
    exit 1
fi

TERRAFORM_DIR="$1"

# Verify the directory exists
if [ ! -d "$TERRAFORM_DIR" ]; then
    echo "ERROR: Directory not found: $TERRAFORM_DIR"
    exit 1
fi

cd "$TERRAFORM_DIR"

echo "=================================="
echo "  TERRAFORM INITIALIZATION"
echo "=================================="
terraform init -input=false

echo "=================================="
echo "  TERRAFORM FORMAT"
echo "=================================="
terraform fmt

echo "=================================="
echo "  TERRAFORM VALIDATION"
echo "=================================="
terraform validate

echo "=================================="
echo "  TERRAFORM PLAN"
echo "=================================="
terraform plan -input=false

echo "=================================="
echo "  TERRAFORM PLAN COMPLETED"
echo "=================================="
