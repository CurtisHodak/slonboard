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

variable "worker_pool_security_groups" {
  description = "SGs in AWS"
  type        = list(any)
  default     = []
}

variable "worker_pool_subnets" {
  description = "SGs in AWS"
  type        = list(any)
  default     = []
}
