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

variable "rollercoaster" {
  type = object({
    public_filepath = string
    content_version = number
  })
}

variable "music" {
  type = object({
    public_filepath = string
    content_version = number
  })
}