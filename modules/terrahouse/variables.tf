variable "user_uuid" {
  type        = string
  description = "UUID for the user"
  validation {
    condition = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.user_uuid))
    error_message = "The user_uuid must be a valid UUID format (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx)."
  }
}

variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
  validation {
    condition = can(regex("^[a-z0-9][a-z0-9.-]*[a-z0-9]$", var.bucket_name)) && length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && !can(regex("\\.\\.+", var.bucket_name)) && !can(regex("^[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}$", var.bucket_name))
    error_message = "Bucket name must be 3-63 characters, start/end with lowercase letter or number, contain only lowercase letters, numbers, hyphens, and periods, not contain consecutive periods, and not be formatted as an IP address."
  }
}

variable "index_html_filepath" {
  description = "The file path for index.html"
  type = string
  validation {
    condition = fileexists(var.index_html_filepath)
    error_message = "The provided path for index.html does not"
  }
}