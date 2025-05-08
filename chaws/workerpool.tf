# module "my_workerpool" {
#   source = "github.com/spacelift-io/terraform-aws-spacelift-workerpool-on-ec2?ref=v3.0.3"

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
#   security_groups   = var.worker_pool_security_groups
#   vpc_subnets       = var.worker_pool_subnets
# }
