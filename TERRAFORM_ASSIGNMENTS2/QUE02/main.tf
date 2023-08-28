resource "aws_eip" "eip" {
  instance = aws_instance.this.id
  domain   = "vpc"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.this.id
  allocation_id = aws_eip.eip.id
}

resource "aws_instance" "this" {
  ami               = var.ami_id
  instance_type     = var.type

  tags = {
    Name = "HelloWorld"
  }
}