output "cdn_id" {
  value = data.aws_cloudfront_distribution.cloudfront.id
  description = "Id do CloudFront"
}

output "cdn_name" {
  value = data.aws_cloudfront_distribution.cloudfront.domain_name
  description = "Nome de domínio do CloudFront"
}