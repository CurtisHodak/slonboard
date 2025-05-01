variable "aws_region" {
  description = "AWS Region for creating resources"
  type        = string
  default     = ""
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