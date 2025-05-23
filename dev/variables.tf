variable "aws_region" {
  description = "AWS Region for creating resources"
  type        = string
  default     = "us-east-2"
}

variable "instance_ami" {
  description = "EC2 AMI to use for new instances"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Instance type for the EC2"
  type        = string
  default     = ""
}

variable "volume_size" {
  description = "Default volume size"
  type        = number
  default     = 5
}

variable "main_vpc_id" {
  description = "default vpc for instances and other items"
  type        = string
  default     = "vpc-0589bc7eac2f31a65"
}