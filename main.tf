resource "aws_instance" "sl_on1" {
  ami           = "ami-060a84cbcb5c14844" // Amazon linux 
  instance_type = "t2.micro"

  tags = {
    Name = "First instance just to have something in the repo"
  }
}

resource "aws_s3_bucket" "sl_on1" {
  bucket = "ch-slonboard-1"

  tags = {
    Description = "New bucket to have something around"
  }
}