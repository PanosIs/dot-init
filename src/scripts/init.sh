#!/usr/bin/env bash

# Run this script when setting up a new system for the first time
# Exit if any of the intermediate steps fail
set -e

# Install Terraform
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf install -y terraform

# Apply all the Terraform stuff
terraform init
terraform apply -auto-approve
terraform -install-autocomplete

echo 'Installation done!'