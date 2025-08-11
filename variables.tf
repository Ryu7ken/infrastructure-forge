variable "teacherseat_user_uuid" {
    type        = string
    description = "UUID for the user"
}

variable "terratowns_access_token" {
    type        = string
    description = "Terratowns access token for the user"
}

variable "terratowns_endpoint" {
    type        = string
    description = "Terratowns Endpoint"
}

variable "index_html_filepath" {
  description = "The file path for index.html"
  type = string
}

variable "error_html_filepath" {
  description = "The file path for error.html"
  type = string
}

variable "content_version" {
  description = "The content version. Should be a postitive integer starting at 1"
  type = number
}

variable "assets_filepath" {
  description = "The file path for the Terrahouse website assets"
  type = string
}