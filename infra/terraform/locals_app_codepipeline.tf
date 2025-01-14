locals {
  build_actions = {
    "Build-API" = {
      project_name = module.build_api.build_name
      output_artifact = "BuildOutputAPI"
    }
    "Build-SQS" = {
      project_name = module.build_sqs.build_name
      output_artifact = "BuildOutputSQS"
    }
    "Build-Cron" = {
      project_name = module.build_cron.build_name
      output_artifact = "BuildOutputCron"
    }
  }
}