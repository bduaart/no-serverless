variable "name" {
  description = "Nome do CodeBuild"
  type        = string
}
variable "buildspec" {
  description = "Nome do arquivo buildspec.yml"
  type        = string
}
variable "lambda_function_name" {
  description = "Nome da função lambda"
  type        = string
}
variable "s3_bucket" {
  description = "Nome do bucket s3"
  type        = string
}
variable "service_role" {
  description = "Arn da Role"
  type        = string
}