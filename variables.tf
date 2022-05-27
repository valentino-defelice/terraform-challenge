variable "bucket_name" {
  type        = string
  description = "S3 bucket where JSON will be stored"
  default     = "test-popularenlinea-valentino-defelice"
}

variable "url" {
  type        = string
  description = "URL to be scanned by script inside EC2"
  default     = "https://popularenlinea.com"
}

variable "b64_token" {
  type        = string
  description = "Base64 Token to be consumed by api https://urlscan.io"
  default     = "B64_API_TOKEN"
}
