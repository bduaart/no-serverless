variable "origin_id" {
  type = string
  description = "Id do bucket"
}

variable "bucket_domain_name" {
  type = string
  description = "Domínio do Bucket"
}

variable "cdn_price_class" {
  type = string
  default = "PriceClass_200"
  description = "Classe de preço do CDN"
}