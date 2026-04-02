resource "aws_s3_bucket" "static_bucket" {
  bucket        = "yeosy.sctp-sandbox.com"
  force_destroy = true
}
resource "aws_s3_bucket_public_access_block" "name" {
  bucket                  = aws_s3_bucket.static_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}
resource "aws_s3_bucket_policy" "allow_public_access" {

}
