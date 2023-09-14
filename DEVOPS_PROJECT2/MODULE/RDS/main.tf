resource "aws_db_instance" "cloudethix-rds" {
  allocated_storage      = 10
  db_name                = var.M_db_name
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = var.M_username
  password               = var.M_password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = var.M_db_subnet_group_name
  vpc_security_group_ids = var.M_vpc_security_group_ids
}
