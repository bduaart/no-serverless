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

variable "cron_rule_name" {
  description = "Nome do CloudWatch Event Rule"
  type        = string
}

variable "schedule_expression" {
  description = "Expressão de agendamento da cron"
  type        = string
}

variable "rule_state" {
  description = "Habilitar(ENABLED) e Desabilitar(DISABLED) para habilitar/desabilitar cron"
  type        = string
  default     = "ENABLED"
}

variable "target_id" {
  description = "Target ID CloudWatch Event Rule"
  type        = string
}
