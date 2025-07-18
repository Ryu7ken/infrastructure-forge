resource "aws_s3_bucket" "website-bucket" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}