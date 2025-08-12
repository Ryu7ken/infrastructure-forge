variable "user_uuid" {
  type        = string
  description = "UUID for the user"
  validation {
    condition = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.user_uuid))
    error_message = "The teacherseat_user_uuid must be a valid UUID format (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx)."
  }
}

# variable "bucket_name" {
#   type        = string
#   description = "Name of the S3 bucket"
#   validation {
#     condition = can(regex("^[a-z0-9][a-z0-9.-]*[a-z0-9]$", var.bucket_name)) && length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && !can(regex("\\.\\.+", var.bucket_name)) && !can(regex("^[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}$", var.bucket_name))
#     error_message = "Bucket name must be 3-63 characters, start/end with lowercase letter or number, contain only lowercase letters, numbers, hyphens, and periods, not contain consecutive periods, and not be formatted as an IP address."
#   }
# }

variable "public_filepath" {
  description = "The file path for the public directory"
  type = string
}

variable "content_version" {
  description = "The content version. Should be a postitive integer starting at 1"
  type = number
  validation {
    condition = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "The content_version must be a positive integer starting at 1"
  }
}