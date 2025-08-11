terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

  # cloud { 
  #   organization = "terraform_bootcamp_2025" 

  #   workspaces { 
  #     name = "terra-house" 
  #   } 
  # }

}

provider "terratowns" {

  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse" {
  source = "./modules/terrahouse"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_filepath = var.assets_filepath
}

resource "terratowns_home" "home" {
  name = "How to play Roller Coaster Tycoon in 2025!"
  description = <<DESCRIPTION
Roller Coaster Tycoon is a game from 1999 created by Chris Sawyer.
It is famous for run running on every Operating System
due to it being 99% written in x86 assembler/machine code (yes, really!), 
with a small amount of C code used to interface to MS Windows and DirectX.
People still love to play it despite its old looking graphics.
This is my guide that will show you how to play Roller Coaster Tycoon.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}