variable "aws_region" {
  description = "AWS Region for creating resources"
  type        = string
  default     = "us-east-2"
}

variable "db_user" {
  description = "Main user of the db"
  type = string
  default = ""
}

variable "db_password" {
  description = "Password for user"
  type = string
  default = ""
}

