# Creating S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}
