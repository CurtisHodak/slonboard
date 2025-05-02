resource "aws_s3_bucket" "sl_on1" {
  bucket = "ch-slonboard-1"

  tags = {
    Description = "New bucket to have something around"
    Test        = "this should do something now 4"
  }
}

module "s3testmodule" {
  source  = "spacelift.io/curtishodak/s3testmodule/default"
  version = "0.1.3"

  bucket     = "chslonboard2"
  versioning = true

  tags = {
    madeone = "yes"
  }
}