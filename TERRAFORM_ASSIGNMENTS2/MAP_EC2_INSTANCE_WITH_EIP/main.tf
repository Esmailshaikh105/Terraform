resource "aws_eip" "this_eip" {
  instance = aws_instance.this_ec2.id
  domain   = "vpc"
}

resource "aws_eip_association" "this_eip_assoc" {
  instance_id   = aws_instance.this_ec2.id
  allocation_id = aws_eip.this_eip.id
}

resource "aws_instance" "this_ec2" {
  ami               = var.ami_id
  instance_type     = var.type

  tags = {
    Name = "HelloWorld"
  }
}