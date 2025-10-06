# # resource "aws_instance" "onboarding1" {
# #   ami           = var.instance_ami
# #   instance_type = var.instance_type
# #   key_name      = "chkey1"

# #   root_block_device {
# #     volume_size = 20
# #   }

# #   tags = {
# #     test = "New Changes123"
# #   }
# # }

# # resource "aws_instance" "onboarding2" {
# #   ami           = var.instance_ami
# #   instance_type = var.instance_type
# #   key_name      = "chkey1"

# #   root_block_device {
# #     volume_size = 20
# #   }

# #   tags = {
# #     test = "New Changes1"
# #   }
# # }

# resource "aws_iam_user" "lb" {
#   name = "loadbalancer"
#   path = "/system/"

#   tags = {
#     tag-key = "tag-value"
#   }
# }

# resource "aws_vpc" "main" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "Main"
#   }
# }
# # Generate random string
# resource "random_string" "suffix" {
#   length  = 8
#   special = false
#   upper   = false
# }
# # Private Subnet
# resource "aws_subnet" "private" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-2a"
#   tags = {
#     Name = "private-subnet-${random_string.suffix.id}"
#   }
# }
# # Public Subnet
# resource "aws_subnet" "public" {
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = "10.0.2.0/24"
#   availability_zone       = "us-east-2b"
#   map_public_ip_on_launch = false
#   tags = {
#     Name = "public-subnet-${random_string.suffix.id}"
#   }
# }

# # Internet Gateway
# resource "aws_internet_gateway" "main" {
#   vpc_id = aws_vpc.main.id
#   tags = {
#     Name = "internet-gateway-${random_string.suffix.id}"
#   }
# }
# # Route Table for public subnet
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.main.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.main.id
#   }
#   tags = {
#     Name = "public-route-table-${random_string.suffix.id}"
#   }
# }
# # Associate the public route table with the public subnet
# resource "aws_route_table_association" "public" {
#   subnet_id      = aws_subnet.public.id
#   route_table_id = aws_route_table.public.id
# }
# # NAT Gateway
# resource "aws_eip" "nat" {
#   domain = "vpc"
#   tags = {
#     Name = "nat-eip-${random_string.suffix.id}"
#   }
# }
# resource "aws_nat_gateway" "main" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.public.id
#   tags = {
#     Name = "nat-gateway-${random_string.suffix.id}"
#   }
# }
# # Route Table for private subnet
# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.main.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.main.id
#   }
#   tags = {
#     Name = "private-route-table-${random_string.suffix.id}"
#   }
# }
# # Associate the private route table with the private subnet
# resource "aws_route_table_association" "private" {
#   subnet_id      = aws_subnet.private.id
#   route_table_id = aws_route_table.private.id
# }
# # Security Group for the worker pool
# resource "aws_security_group" "main" {
#   name        = "worker-pool-example-${random_string.suffix.id}"
#   description = "Worker pool security group, with unrestricted egress and restricted ingress"
#   vpc_id      = aws_vpc.main.id
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
# }
# # Security Group Ingress Rules
# resource "aws_security_group_rule" "ingress_rule_1" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       = ["3.248.70.24/32"]
#   description       = "Allow ingress from Spacelift IP 3.248.70.24"
#   security_group_id = aws_security_group.main.id
# }
# resource "aws_security_group_rule" "ingress_rule_2" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       = ["34.246.213.75/32"]
#   description       = "Allow ingress from Spacelift IP 34.246.213.75"
#   security_group_id = aws_security_group.main.id
# }
# resource "aws_security_group_rule" "ingress_rule_3" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       = ["52.49.218.181/32"]
#   description       = "Allow ingress from Spacelift IP 52.49.218.181"
#   security_group_id = aws_security_group.main.id
# }

# module "main_workerpool" {
#  source = "github.com/spacelift-io/terraform-aws-spacelift-workerpool-on-ec2?ref=v5.2.0"

#   secure_env_vars = {
#     SPACELIFT_TOKEN            = var.worker_pool_config
#     SPACELIFT_POOL_PRIVATE_KEY = var.worker_pool_private_key
#   }
#   configuration = <<EOF
#     export SPACELIFT_SENSITIVE_OUTPUT_UPLOAD_ENABLED=true
#   EOF

#   ec2_instance_type = "t3.medium"
#   min_size          = 1
#   max_size          = 5
#   worker_pool_id    = var.worker_pool_id
#   security_groups   = [aws_security_group.main.id]
#   vpc_subnets       = [aws_subnet.public.id, aws_subnet.private.id]
# }

# module "s3testmodule" {
#   source  = "spacelift.io/curtishodak/s3testmodule/default"
#   version = "0.4.2"

  # Optional inputs
  #  bucket     = "this-is-a-test-bucket-12345432432"
  # tags       = map(any)
  # versioning = bool
# }