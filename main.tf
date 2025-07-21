terraform {

  # cloud { 
  #   organization = "terraform_bootcamp_2025" 

  #   workspaces { 
  #     name = "terra-house" 
  #   } 
  # }

}

module "terrahouse" {
  source = "./modules/terrahouse"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}