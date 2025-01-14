module "api_gateway_lambda" {
  source          = "./api_gateway"
  lambda_name     = "api-gateway-bduarte"
  handler         = "build/api/handler.processApiHandler"
  lambda_role_arn = aws_iam_role.lambda_role.arn
  s3_bucket       = aws_s3_bucket.aws_s3_bucket_bd_no_project.id
  s3_key          = "api.zip"
  api_name        = "api_bduarte"
  api_path        = "is-alive"
  http_methods    = ["GET", "POST"]
  stage_name      = "dev"
}
