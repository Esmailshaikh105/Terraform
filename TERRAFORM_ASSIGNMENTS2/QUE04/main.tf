
// CREATE VPC
resource "aws_vpc" "MY_VPC" {
  cidr_block       =  var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}
// PUBLIC SUBNETS
resource "aws_subnet" "public_subnets01" {
  vpc_id     = aws_vpc.MY_VPC.id
  availability_zone = var.availability_zone
  cidr_block = var.pub_cidr
}

// internet gateway
resource "aws_internet_gateway" "MY_IG" {
  vpc_id = aws_vpc.MY_VPC.id
}

  // PUBLIC ROUTE TABLE
resource "aws_route_table" "PUBLIC_RT" {
  vpc_id = aws_vpc.MY_VPC.id
}
// routes
resource "aws_route" "route_public" {
  route_table_id            = aws_route_table.PUBLIC_RT.id
  destination_cidr_block    = var.destination_cidr
  gateway_id = aws_internet_gateway.MY_IG.id
}

// rt association
resource "aws_route_table_association" "RTAS_PUBLIC" {
  subnet_id      = aws_subnet.public_subnets01.id
  route_table_id = aws_route_table.PUBLIC_RT.id
}

// ssh key

resource "aws_key_pair" "this_key" {
  key_name   = var.aws_key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDKZUeh5ZssVKihdY0IUg7kFehTleZQLsQJQuy6K19Aff0D3j8roAH3pTq9yxJkHsyD62SKOeUqgnIbOfwv9JW0T4LGKSkU7WH5WZ+b1An7tZwA3U827mh0VbgalH0FanO1r46p83b0T2oqy/7K+L699LMD3f6StUcHyQ8GZ7c0E1NZirJbBfzm6lV+gEQchlznykc88ku/OXMQuliCRV24YHentKQhE13psPCXTPhp34JOMJdYlDvSQYHendO/GFsjf7Fq+30rNgdgFUYaFiAxR59tHU2mJIAdA/k+u45cW6LdZp9Ww2XTHg39njGaGc8M6crFbDwbOU46GDz0NtWV"
}

// security group

resource "aws_security_group" "my_sg" {
  name        = "allow_ssh"
  description = "Allow ssh in inbound traffic"
  vpc_id      = aws_vpc.MY_VPC.id

  ingress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.MY_VPC.cidr_block]
  }
}
 
 
  // create ec2 instance
  resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.this_key.key_name
  tags = {
    Name = "my1stinstance"
    
  }
}