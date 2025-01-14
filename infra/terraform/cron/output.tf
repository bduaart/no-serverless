output "lambda_function_name" {
  value = aws_lambda_function.lambda.function_name
}

output "cloudwatch_event_rule_arn" {
  value = aws_cloudwatch_event_rule.cron_job.arn
}
