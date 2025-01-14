output "bucket_domain_name" {
  value = aws_s3_bucket.bucket.bucket_domain_name
  description = "Nome de domínio do bucket"
}

output "bucket_id" {
  value = aws_s3_bucket.bucket.id
  description = "Id de domínio do bucket"
}