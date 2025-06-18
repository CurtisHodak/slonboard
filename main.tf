resource "aws_instance" "onboarding1" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = "chkey1"

  root_block_device {
    volume_size = 17
  }

  tags = {
    test = "New Changes1"
  }
}