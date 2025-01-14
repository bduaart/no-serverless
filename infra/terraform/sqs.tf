module "sqs_lambda_bduarte_queue" {
  source      = "./sqs"
  queue_name  = "queue-bduarte"
  lambda_name = "lambda-queue-bduarte"
  handler     = "build/sqs/handler.processSQSHandler"
  s3_bucket   = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
  s3_key      = "sqs.zip"
  lambda_role_arn = aws_iam_role.lambda_role.arn
}

# output "sqs_lambda_bduaart_function_name" {
#   value = module.sqs_lambda_bduarte_queue.lambda_function_name
# }