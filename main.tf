# resource "aws_instance" "onboarding1" {
#   ami           = var.instance_ami
#   instance_type = var.instance_type
#   key_name      = "chkey1"

#   root_block_device {
#     volume_size = 20
#   }

#   tags = {
#     test = "New Changes123"
#   }
# }

# resource "aws_instance" "onboarding2" {
#   ami           = var.instance_ami
#   instance_type = var.instance_type
#   key_name      = "chkey1"

#   root_block_device {
#     volume_size = 20
#   }

#   tags = {
#     test = "New Changes1"
#   }
# }

module "main_workerpool" {
  source = "github.com/spacelift-io/terraform-aws-spacelift-workerpool-on-ec2?ref=v3.0.3"

  secure_env_vars = {
    SPACELIFT_TOKEN            = var.worker_pool_config
    SPACELIFT_POOL_PRIVATE_KEY = var.worker_pool_private_key
  }
  configuration = <<EOF
    export SPACELIFT_SENSITIVE_OUTPUT_UPLOAD_ENABLED=true
  EOF

  ec2_instance_type = "t3.medium"
  min_size          = 1
  max_size          = 5
  worker_pool_id    = var.worker_pool_id
  security_groups   = [aws_security_group.main.id]
  vpc_subnets       = [aws_subnet.public.id, aws_subnet.private.id]
}