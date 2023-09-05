resource "aws_instance" "M_aws_instance" {
  ami                    = var.M_ami_id
  instance_type          = var.M_instance_type
  key_name                =  var.M_key_name
}


