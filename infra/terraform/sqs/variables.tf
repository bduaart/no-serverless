variable "queue_name" {
  description = "Nome da fila SQS"
  type        = string
}

variable "lambda_name" {
  description = "Nome da função Lambda"
  type        = string
}

variable "handler" {
  description = "Handler da função Lambda"
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
variable "lambda_role_arn" {
  description = "Arn da role do IAM"
  type        = string
}