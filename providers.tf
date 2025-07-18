terraform {

  # cloud { 
  #   organization = "terraform_bootcamp_2025" 

  #   workspaces { 
  #     name = "terra-house" 
  #   } 
  # }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
