terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket = "my-remote-state-file"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

provider "aws" {
  # Configuration options
}