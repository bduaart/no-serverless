resource "aws_sqs_queue" "queue" {
  name = var.queue_name
}

resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_name
  handler       = var.handler
  runtime       = "nodejs20.x"
  role          = var.lambda_role_arn
 # role          = aws_iam_role.lambda_role.arn
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
}

resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = aws_sqs_queue.queue.arn
  function_name    = aws_lambda_function.lambda.function_name
}

resource "aws_lambda_permission" "sqs_invoke_permission" {
  statement_id  = "AllowSQSToInvokeFunction-${var.lambda_name}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "sqs.amazonaws.com"
  source_arn    = aws_sqs_queue.queue.arn
}