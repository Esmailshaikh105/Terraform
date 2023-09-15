resource "aws_db_subnet_group" "M_cloudethix-rds-db-sub" {
  name       = var.M_db_sg_name
  subnet_ids = var.M_db_subnet_ids

}