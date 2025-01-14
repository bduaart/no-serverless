variable "lambda_name" {
  description = "Nome da cron"
  type        = string
}

variable "handler" {
  description = "Handler da função Lambda"
  type        = string
}

variable "lambda_role_arn" {
  description = "Arn da role do IAM"
  type        = string
}

variable "s3_bucket" {
  description = "Nome do bucket S3"
  type        = string
}

variable "s3_key" {
  description = "Nome do arquivo .zip no S3 para o código da Lambda"
  type        = string
}

variable "api_name" {
  description = "Nome da API Gateway"
  type        = string
}

variable "api_path" {
  description = "Path da API"
  type        = string
}

variable "http_methods" {
  description = "List dos métodos HTTP da API"
  type        = list(string)
}

variable "stage_name" {
  description = "Nome do stage"
  type        = string
}
