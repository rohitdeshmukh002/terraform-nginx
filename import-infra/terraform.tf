terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "rohit-terraform-state-2026-unique"
    key          = "terrform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}