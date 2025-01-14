resource "aws_codebuild_project" "codebuild_project" {
  name          = var.name
  service_role  = var.service_role
  source {
    type      = "CODEPIPELINE"
    buildspec = var.buildspec
  }
  artifacts {
    type = "CODEPIPELINE"
  }
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:5.0"
    type         = "LINUX_CONTAINER"

    environment_variable {
      name  = "S3_BUCKET"
      value = var.s3_bucket
    }
    environment_variable {
      name  = "LAMBDA_FUNCTION_NAME"
      value = var.lambda_function_name
    }
  }
}
