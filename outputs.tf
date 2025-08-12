output "bucket_name" {
    description = "Bucket name for our static website hosting"
    value = module.home_rollercoaster_hosting.bucket_name
}

output "s3_website_endpoint" {
    description = "S3 Static Website Hosting Endpoint"
    value = module.home_rollercoaster_hosting.website_endpoint
}

output "cloudfront_endpoint" {
    description = "CloudFront Distribution URL"
    value = module.home_rollercoaster_hosting.cloudfront_domain
}