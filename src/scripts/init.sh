#!/usr/bin/env bash

# Run this script when setting up a new system for the first time
# Exit if any of the intermediate steps fail
set -e

# Install Terraform
dnf install -y dnf-plugins-core
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
dnf install -y terraform

# Apply all the Terraform stuff
terraform init
terraform apply -auto-approve
terraform -install-autocomplete

echo 'Installation done!'