resource "aws_instance" "onboarding1" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = "chkey1"

  root_block_device {
    volume_size = 20
  }

  tags = {
    test = "New Changes123"
  }
}

resource "aws_instance" "onboarding2" {
  ami           = 
  instance_type = var.instance_type
  key_name      = "chkey1"

  root_block_device {
    volume_size = 20
  }

  tags = {
    test = "New Changes1"
  }
}