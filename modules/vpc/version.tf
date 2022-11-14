terraform {

  required_version = "~> 1.1.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.40"
    }
  }
}

data "aws_caller_identity" "current" {}
