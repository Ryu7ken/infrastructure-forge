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
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
}