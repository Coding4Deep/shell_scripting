#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Terraform plan+apply with logging; auto abort on error
# Usage: "$0" [DIR]
DIR=${1:-.}
cd "$DIR"
terraform init -input=false
terraform plan -input=false -out=tfplan | tee tf.plan.log
terraform apply -input=false -auto-approve tfplan | tee tf.apply.log
