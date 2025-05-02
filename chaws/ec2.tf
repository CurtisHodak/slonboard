# resource "aws_instance" "onboarding1" {
#   ami           = var.instance_ami
#   instance_type = var.instance_type

#   tags = {
#     test = "another test"
#   }
# }

# resource "aws_instance" "onboarding2" {
#   ami           = var.instance_ami
#   instance_type = var.instance_type

#   tags = {
#     contextTest = "yup"
#   }
# }