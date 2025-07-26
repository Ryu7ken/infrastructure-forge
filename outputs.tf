output "bucket_name" {
    description = "Bucket name for our static website hosting"
    value = module.terrahouse.bucket_name
}

output "s3_website_endpoint" {
    description = "S3 Static Website Hosting Endpoint"
    value = module.terrahouse.website_endpoint
}

output "cloudfront_endpoint" {
    description = "CloudFront Distribution URL"
    value = module.terrahouse.cloudfront_domain
}