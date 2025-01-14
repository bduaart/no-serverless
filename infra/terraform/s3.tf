resource "aws_s3_bucket" "aws_s3_bucket_bd_no_project" {
  bucket = "bd-no-serverless"
}
resource "aws_s3_bucket" "artifacts" {
  bucket = "no-serverless-artifacts"
}