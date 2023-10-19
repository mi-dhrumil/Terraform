#!/bin/bash
set -e
# Run your Terraform commands here
terraform init
terraform apply -auto-approve

# Run your Ansbile commands here
ANSIBLE_NOCOWS=1  ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i localhost, -e "ansible_ssh_host=$(terraform output -json elastic_ip | jq -r .)" main.yml --extra-vars "ansible_user=ubuntu"

