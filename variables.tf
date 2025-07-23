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