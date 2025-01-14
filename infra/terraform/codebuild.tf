module "build_api" {
  source              = "./codebuild"
  name                = "build-api"
  buildspec           = "buildspec-api.yml"
  lambda_function_name = module.api_gateway_lambda.lambda_function_name
  s3_bucket           = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
  service_role        = aws_iam_role.codebuild_iam_role.arn
}

module "build_sqs" {
  source              = "./codebuild"
  name                = "build-sqs"
  buildspec           = "buildspec-sqs.yml"
  lambda_function_name = module.sqs_lambda_bduarte_queue.lambda_function_name
  s3_bucket           = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
  service_role        = aws_iam_role.codebuild_iam_role.arn
}

module "build_cron" {
  source              = "./codebuild"
  name                = "build-cron"
  buildspec           = "buildspec-cron.yml"
  lambda_function_name = module.cron_lambda.lambda_function_name
  s3_bucket           = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
  service_role        = aws_iam_role.codebuild_iam_role.arn
}
