resource "aws_instance" "onboarding1" {
  vpc_id        = aws_vpc.example.id
  ami           = "ami-060a84cbcb5c14844"
  instance_type = "t2.micro"
}