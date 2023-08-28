// CREATE VPC
resource "aws_vpc" "MY_VPC" {
  cidr_block       =  var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

 // PRIVATE SUBNETS

 resource "aws_subnet" "private_subnets01" {
  vpc_id     = aws_vpc.MY_VPC.id
  availability_zone = var.availability_zone[0]
  cidr_block = var.pvt_cidr[0]
}

resource "aws_subnet" "private_subnets02" {
  vpc_id     = aws_vpc.MY_VPC.id
  availability_zone = var.availability_zone[1]
  cidr_block = var.pvt_cidr[1]
}

// PUBLIC SUBNETS
resource "aws_subnet" "public_subnets01" {
  vpc_id     = aws_vpc.MY_VPC.id
  availability_zone = var.availability_zone[0]
  cidr_block = var.pub_cidr[0]
}


resource "aws_subnet" "public_subnets02" {
  vpc_id     = aws_vpc.MY_VPC.id
  availability_zone = var.availability_zone[1]
  cidr_block = var.pub_cidr[1]
}


// INTERNET GETWAY AND ELASTIC_IP
resource "aws_internet_gateway" "MY_IGW" {
  vpc_id = aws_vpc.MY_VPC.id
}
resource "aws_eip" "my_eip" {
  vpc      = true
}


// PUBLIC NAT GATEWAY

resource "aws_nat_gateway" "MY_NAT" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnets01.id
  }

  // PUBLIC ROUTE TABLE
resource "aws_route_table" "PUBLIC_RT" {
  vpc_id = aws_vpc.MY_VPC.id
}
  //PRIVATE_ROUTE_TABLE
  resource "aws_route_table" "PRIVATE_RT" {
  vpc_id = aws_vpc.MY_VPC.id
  }


// PUBLIC AND PRIVATE ROUTE TABLE [IG AND NAT]

resource "aws_route" "route_public" {
  route_table_id            = aws_route_table.PUBLIC_RT.id
  destination_cidr_block    = var.destination_cidr
  gateway_id = aws_internet_gateway.MY_IGW.id
}


resource "aws_route" "route_private" {
  route_table_id            = aws_route_table.PRIVATE_RT.id
  destination_cidr_block    =  var.destination_cidr
    gateway_id = aws_nat_gateway.MY_NAT.id
}

// ROUTE TABLE ASSOCIATION

resource "aws_route_table_association" "RTAS_PUBLIC" {
  subnet_id      = aws_subnet.public_subnets01.id
  route_table_id = aws_route_table.PUBLIC_RT.id
}

resource "aws_route_table_association" "RTAS_PRIVATE" {
  subnet_id      = aws_subnet.private_subnets01.id
  route_table_id = aws_route_table.PRIVATE_RT.id
}


