resource "aws_instance" "onboarding1" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = "chkey1"
  vpc_security_group_ids = ["sg-0cbca007e6ac73276"]

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    test = "New Changes"
  }
}
