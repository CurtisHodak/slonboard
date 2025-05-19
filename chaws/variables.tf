variable "aws_region" {
  description = "AWS Region for creating resources"
  type        = string
  default     = "us-east-2"
}

variable "worker_pool_config" {
  description = "Spacelift Token"
  type        = string
  default     = ""
}

variable "worker_pool_private_key" {
  description = "Private key"
  type        = string
  default     = ""
}

variable "worker_pool_id" {
  description = "worker_pool_id"
  type        = string
  default     = ""
}

# variable "worker_pool_security_groups" {
#   description = "SGs in AWS"
#   type        = list(any)
#   default     = []
# }

# variable "worker_pool_subnets" {
#   description = "SGs in AWS"
#   type        = list(any)
#   default     = []
# }

variable "spacelift_api_key_id" {
  type        = string
  description = "ID of the Spacelift API key to use"
  default     = null
}

variable "spacelift_api_key_secret" {
  type        = string
  sensitive   = true
  description = "Secret corresponding to the Spacelift API key to use"
}

variable "spacelift_api_key_endpoint" {
  type        = string
  description = "Full URL of the Spacelift API endpoint to use, eg. https://demo.app.spacelift.io"
  default     = null
}