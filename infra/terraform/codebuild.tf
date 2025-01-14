module "build_api" {
  source              = "codebuild"
  name                = "build-api"
  buildspec           = "buildspec-api.yml"
  lambda_function_name = module.api_gateway_lambda.lambda_function_name
  s3_bucket           = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
  service_role        = aws_iam_role.codebuild_iam_role.arn
}

module "build_sqs" {
  source              = "codebuild"
  name                = "build-sqs"
  buildspec           = "buildspec-sqs.yml"
  lambda_function_name = module.sqs_lambda_bduarte_queue.lambda_function_name
  s3_bucket           = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
  service_role        = aws_iam_role.codebuild_iam_role.arn
}

module "build_cron" {
  source              = "codebuild"
  name                = "build-cron"
  buildspec           = "buildspec-cron.yml"
  lambda_function_name = module.cron_lambda.lambda_function_name
  s3_bucket           = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
  service_role        = aws_iam_role.codebuild_iam_role.arn
}


# resource "aws_codebuild_project" "api" {
#   name          = "build-api"
#   service_role = aws_iam_role.codebuild_iam_role.arn
#   source {
#     type      = "CODEPIPELINE"
#     buildspec = "buildspec-api.yml"
#   }
#   artifacts {
#     type = "CODEPIPELINE"
#   }
#   environment {
#     compute_type = "BUILD_GENERAL1_SMALL"
#     image        = "aws/codebuild/standard:5.0"
#     type         = "LINUX_CONTAINER"
#     environment_variable {
#       name  = "S3_BUCKET"
#       value = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
#     }
#     environment_variable {
#       name  = "LAMBDA_API_FUNCTION_NAME"
#       value = module.api_gateway_lambda.lambda_function_name
#     }
#   }
# }
#
# resource "aws_codebuild_project" "sqs" {
#   name          = "build-sqs"
#   service_role = aws_iam_role.codebuild_iam_role.arn
#   source {
#     type      = "CODEPIPELINE"
#     buildspec = "buildspec-sqs.yml"
#   }
#   artifacts {
#     type = "CODEPIPELINE"
#   }
#   environment {
#     compute_type = "BUILD_GENERAL1_SMALL"
#     image        = "aws/codebuild/standard:5.0"
#     type         = "LINUX_CONTAINER"
#     environment_variable {
#       name  = "S3_BUCKET"
#       value = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
#     }
#     environment_variable {
#       name  = "LAMBDA_SQS_FUNCTION_NAME"
#       value = module.sqs_lambda_bduarte_queue.lambda_function_name
#     }
#   }
# }
#
# resource "aws_codebuild_project" "cron" {
#   name          = "build-cron"
#   service_role = aws_iam_role.codebuild_iam_role.arn
#   source {
#     type      = "CODEPIPELINE"
#     buildspec = "buildspec-cron.yml"
#   }
#   artifacts {
#     type = "CODEPIPELINE"
#   }
#   environment {
#     compute_type = "BUILD_GENERAL1_SMALL"
#     image        = "aws/codebuild/standard:5.0"
#     type         = "LINUX_CONTAINER"
#     environment_variable {
#       name  = "S3_BUCKET"
#       value = aws_s3_bucket.aws_s3_bucket_bd_no_project.bucket
#     }
#     environment_variable {
#       name  = "LAMBDA_CRON_FUNCTION_NAME"
#       value = module.cron_lambda.lambda_function_name
#     }
#   }
# }
#
# resource "aws_codepipeline" "pipeline" {
#   name = "no-serverless"
#
#   role_arn = aws_iam_role.codepipeline_iam_role.arn
#
#   artifact_store {
#     type = "S3"
#     location = aws_s3_bucket.artifacts.bucket
#   }
#
#   stage {
#     name = "Source"
#     action {
#       name             = "Source"
#       category         = "Source"
#       owner            = "AWS"
#       provider         = "CodeStarSourceConnection"
#       version          = "1"
#       output_artifacts = ["SourceOutput"]
#       configuration = {
#         ConnectionArn  = aws_codestarconnections_connection.github_connection.arn
#         FullRepositoryId = "bduaart/no-serverless"
#         BranchName      = "main"
#       }
#     }
#   }
#
#
#   stage {
#     name = "Build"
#     action {
#       name             = "Build-API"
#       category         = "Build"
#       owner            = "AWS"
#       provider         = "CodeBuild"
#       version          = "1"
#       input_artifacts  = ["SourceOutput"]
#       output_artifacts = ["BuildOutputAPI"]
#       configuration = {
#         ProjectName = aws_codebuild_project.api.name
#       }
#     }
#     action {
#       name             = "Build-SQS"
#       category         = "Build"
#       owner            = "AWS"
#       provider         = "CodeBuild"
#       version          = "1"
#       input_artifacts  = ["SourceOutput"]
#       output_artifacts = ["BuildOutputSQS"]
#       configuration = {
#         ProjectName = aws_codebuild_project.sqs.name
#       }
#     }
#     action {
#       name             = "Build-Cron"
#       category         = "Build"
#       owner            = "AWS"
#       provider         = "CodeBuild"
#       version          = "1"
#       input_artifacts  = ["SourceOutput"]
#       output_artifacts = ["BuildOutputCron"]
#       configuration = {
#         ProjectName = aws_codebuild_project.cron.name
#       }
#     }
#   }
# }
