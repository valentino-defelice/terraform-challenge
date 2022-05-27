# AWS as our provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure AWS region
provider "aws" {
  region = "us-east-1"
}
