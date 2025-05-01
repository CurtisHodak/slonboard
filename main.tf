// Now deleting the vpc, I don't use it, check approval
# resource "aws_vpc" "example" {
#   cidr_block = "10.0.0.0/16"
# }

resource "aws_iam_user" "badUser" {
  name = "badUser"

  tags = {
    description = "One uncool dude"
  }
}