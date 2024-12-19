terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  backend "local" {
    path = "C:terraform/terrafomFile/stateTerraform.tfstate"
  }
}

# Configure and downloading plugins for AWS
provider "aws" {
  region = "${var.region}"
}