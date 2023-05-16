terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket         = "terragrunt-246580622155-statefiles"
    dynamodb_table = "terragrunt-246580622155-lockfiles"
    encrypt        = true
    key            = "core-infrastructure/uat/vpc_attachments/terraform.tfstate"
    region         = "us-east-1"
  }
}