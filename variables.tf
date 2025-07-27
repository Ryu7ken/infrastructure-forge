variable "user_uuid" {
    type        = string
    description = "UUID for the user"
}

variable "bucket_name" {
    type        = string
    description = "Name of the S3 bucket"
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