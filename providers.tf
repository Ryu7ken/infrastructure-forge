terraform {

  # cloud { 
  #   organization = "terraform_bootcamp_2025" 

  #   workspaces { 
  #     name = "terra-house" 
  #   } 
  # }

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  
}