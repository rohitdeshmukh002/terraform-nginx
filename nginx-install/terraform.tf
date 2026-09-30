terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "terraform-gen-s3-bucket"
    key = "terrform.tfstate"
    region = "ap-south-1"
    use_lockfile = true

  }
}