resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_name
  handler       = var.handler
  runtime       = "nodejs18.x"
  role          = var.lambda_role_arn
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
}

resource "aws_cloudwatch_event_rule" "cron_job" {
  name                = var.cron_rule_name
  schedule_expression = var.schedule_expression
  state               = var.rule_state
}

resource "aws_cloudwatch_event_target" "cron_target" {
  rule      = aws_cloudwatch_event_rule.cron_job.name
  target_id = var.target_id
  arn       = aws_lambda_function.lambda.arn
}

resource "aws_lambda_permission" "allow_event_rule" {
  statement_id  = "AllowExecutionFromCloudWatch-${var.lambda_name}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.cron_job.arn
}
