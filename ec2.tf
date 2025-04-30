resource "aws_instance" "onboarding1" {
  ami           = "ami-060a84cbcb5c14844"
  instance_type = "t2.micro"
}