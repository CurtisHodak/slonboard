variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "description"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "type of instance"
}

variable "instance_ami" {
  type        = string
  default     = "ami-0779fe5e56472b841"
  description = "ami id of the instance default arm amz linux"
}