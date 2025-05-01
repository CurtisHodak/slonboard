resource "aws_s3_bucket" "sl_on1" {
  bucket = "ch-slonboard-1"

  tags = {
    Description = "New bucket to have something around"
  }
}