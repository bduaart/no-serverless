resource "aws_codepipeline" "pipeline" {
  name     = "no-serverless"
  role_arn = aws_iam_role.codepipeline_iam_role.arn

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.artifacts.bucket
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["SourceOutput"]
      configuration = {
        ConnectionArn  = aws_codestarconnections_connection.github_connection.arn
        FullRepositoryId = "bduaart/no-serverless"
        BranchName      = "main"
      }
    }
  }

  stage {
    name = "Build"
    action {
      name             = "Build-API"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceOutput"]
      output_artifacts = [local.build_actions.Build-API.output_artifact]
      configuration = {
        ProjectName = local.build_actions.Build-API.project_name
      }
    }
    action {
      name             = "Build-SQS"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceOutput"]
      output_artifacts = [local.build_actions.Build-SQS.output_artifact]
      configuration = {
        ProjectName = local.build_actions.Build-SQS.project_name
      }
    }
    action {
      name             = "Build-Cron"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceOutput"]
      output_artifacts = [local.build_actions.Build-Cron.output_artifact]
      configuration = {
        ProjectName = local.build_actions.Build-Cron.project_name
      }
    }
  }
}

