variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "description"
}

variable "instance_type" {
  type        = string
  default     = "t4g.nano"
  description = "type of instance"
}

variable "instance_ami" {
  type        = string
  default     = "ami-0779fe5e56472b841"
  description = "ami id of the instance default arm amz linux"
}

variable "worker_pool_config" {
  type    = string
  default = ""
}

variable worker_pool_private_key {
  type = string
  default = ""
}

variable "worker_pool_id" {
  type    = string
  default = "01JTTTH31F1KDXDPQZWH46GQKP"
}
