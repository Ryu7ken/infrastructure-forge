# Static Website Hosting Bucket

We need to provide the resource to upload files and enable static website hosting for our S3 bucket.

[Terraform Resource for Static Website Hosting](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration)

```hcl
resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}
```

Also we need to output the S3 Website Endpoint URL of the bucket after static website hosting is enabled.

```hcl
output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}
```

## Uploading Files for Hosting

[Terraform Resource for File Uploading for Website Hosting](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object)

```hcl
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "path/to/file"
}
```

## Working with Files of Website

[Referencing File Path from Special Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

We need to provide `${path.root}` to reference the root of the workspace and then the absolute path to the `index.html` file.

```hcl
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"
}
```

## Bucket Etags

We need to add `etags` to our bucket so that terraform is able to track changes in the files for Hosting.

```hcl
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"
  etag = filemd5("${path.root}/public/index.html")
}
```

## Terraform Variable for Referencing File

[File Exists Function](https://developer.hashicorp.com/terraform/language/functions/fileexists)

We need to create a Variable to provide the file path for the files for Hosting, so that we don't hard code the paths.

```hcl
variable "index_html_filepath" {
  description = "The file path for index.html"
  type = string
  validation {
    condition = fileexists(var.index_html_filepath)
    error_message = "The provided path for index.html does not"
  }
}

variable "error_html_filepath" {
  description = "The file path for error.html"
  type = string
  validation {
    condition = fileexists(var.error_html_filepath)
    error_message = "The provided path for error.html does not"
  }
}
```

And in `terraform.tfvars` provide the absolute path.

```hcl
index_html_filepath="c:/Users/Ryuken/Documents/terraform-bootcamp/public/index.html"
error_html_filepath="c:/Users/Ryuken/Documents/terraform-bootcamp/public/error.html"
```

## Fileexists Function

This a built-in Terraform function to check the existence of a file.

```hcl
  validation {
    condition = fileexists(var.error_html_filepath)
    error_message = "The provided path for error.html does not"
  }
```