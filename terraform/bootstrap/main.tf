# Run this configuration first to create the backend infrastructure before applying any other Terraform configurations that depend on it.
# To apply this configuration, use the following commands:
# 1. Initialize Terraform: terraform init
# 2. Plan the changes: terraform plan
# 3. Apply the changes: terraform apply
# This setup is crucial for teams working on shared Terraform projects, as it ensures that the state is securely stored and that concurrent modifications are prevented through locking.
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}


provider "aws" {
  region = var.region
}
