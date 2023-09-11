resource "aws_key_pair" "M_login_key" {
  key_name   = var.M_keyname
  public_key = file(var.M_public_key_path)
}

