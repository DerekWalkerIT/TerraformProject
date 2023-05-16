terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket         = "terragrunt-528259682230-statefiles"
    dynamodb_table = "terragrunt-528259682230-lockfiles"
    encrypt        = true
    key            = "core-infrastructure/dev/transit_gateway_route_attachments/terraform.tfstate"
    region         = "us-east-1"
  }
}