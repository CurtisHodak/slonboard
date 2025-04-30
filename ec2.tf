resource "aws_instance" "onboarding1" {
  vpc_id = aws_vpc.example.id
  ami_id = "ami-060a84cbcb5c14844"

}