resource "aws_instance" "dev1a" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = "chkey1"

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    name = "dev1a"
    test = "New Changes1"
  }
}
