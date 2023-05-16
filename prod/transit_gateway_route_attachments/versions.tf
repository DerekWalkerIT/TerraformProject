terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket         = "terragrunt-209591795217-statefiles"
    dynamodb_table = "terragrunt-209591795217-lockfiles"
    encrypt        = true
    key            = "core-infrastructure/prod/transit_gateway_route_attachments/terraform.tfstate"
    region         = "us-east-1"
  }
}