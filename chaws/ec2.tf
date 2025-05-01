resource "aws_instance" "onboarding1" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = {
    test = "yes"
  }
}