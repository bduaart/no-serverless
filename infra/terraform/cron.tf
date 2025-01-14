module "cron_lambda" {
  source             = "./cron"
  lambda_name        = "cron-bduarte-job"
  handler            = "build/cron/handler.processSchedulerHandler"
  lambda_role_arn    = aws_iam_role.lambda_role.arn
  s3_bucket          = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
  s3_key             = "cron.zip"
  cron_rule_name     = "cron-bduarte-schedule"
  schedule_expression = "cron(0/2 * * * ? *)"
  #rule_state         = "ENABLED"
  rule_state         = "DISABLED"
  target_id          = "cron-bduarte-job-target"
}
