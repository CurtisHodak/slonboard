# resource "aws_db_instance" "default" {
#   allocated_storage    = 20
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "8.0"
#   instance_class       = "db.t3.micro"
#   username             = var.db_user
#   password             = var.db_password
#   parameter_group_name = "default.mysql8.0"
#   skip_final_snapshot  = true
# }