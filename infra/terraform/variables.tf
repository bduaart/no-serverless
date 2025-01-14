variable "state_bucket" {
  type        = string
  default     = "curso-iac-state-bucket-tf"
  description = "Bucket com o estado"
}

variable "name" {
  type        = string
  description = "Name of project"
  default = "no-serverless"
}