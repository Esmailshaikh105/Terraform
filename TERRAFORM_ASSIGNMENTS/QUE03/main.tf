resource "aws_security_group" "mysg" {
  name        = var.sg_name
  description = "Allow HTTP and ssh traffic"

  ingress {
    from_port        = var.http_port
    to_port          = var.http_port
    protocol         = "tcp"
    cidr_blocks      = ["172.31.0.0/16"]
  }

   ingress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = ["172.31.0.0/16"]
  }
}
  resource "aws_instance" "MYEC2" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  security_groups = [aws_security_group.mysg.name]
}

