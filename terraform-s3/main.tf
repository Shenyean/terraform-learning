resource "aws_s3_bucket" "bucket1" {
  bucket_prefix = "yeosy-bucket-"
  force_destroy = true
}