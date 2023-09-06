// CREATE VPC
resource "aws_vpc" "M_MY_VPC" {
  cidr_block       =  var.M_vpc_cidr
  instance_tenancy = "default"

}

 // PRIVATE SUBNETS

 resource "aws_subnet" "M_private_subnets01" {
  vpc_id     = aws_vpc.M_MY_VPC.id
  availability_zone = var.M_availability_zone[0]
  cidr_block = var.M_pvt_cidr[0]
}

resource "aws_subnet" "M_private_subnets02" {
  vpc_id     = aws_vpc.M_MY_VPC.id
  availability_zone = var.M_availability_zone[1]
  cidr_block = var.M_pvt_cidr[1]
}

// PUBLIC SUBNETS
resource "aws_subnet" "M__public_subnets01" {
  vpc_id     = aws_vpc.M_MY_VPC.id
  availability_zone = var.M_availability_zone[0]
  cidr_block = var.pub_cidr[0]
}


resource "aws_subnet" "M_public_subnets02" {
  vpc_id     = aws_vpc.M_MY_VPC.id
  availability_zone = var.M_availability_zone[1]
  cidr_block = var.M_pub_cidr[1]
}


// INTERNET GETWAY AND ELASTIC_IP
resource "aws_internet_gateway" "M_MY_IGW" {
  vpc_id = aws_vpc.M_MY_VPC.id
}
resource "aws_eip" "M_my_eip" {
  vpc      = true
}


// PUBLIC NAT GATEWAY

resource "aws_nat_gateway" "M_MY_NAT" {
  allocation_id = aws_eip.M_my_eip.id
  subnet_id     = aws_subnet.M_public_subnets01.id
  }

  // PUBLIC ROUTE TABLE
resource "aws_route_table" "M_PUBLIC_RT" {
  vpc_id = aws_vpc.M_MY_VPC.id
}
  //PRIVATE_ROUTE_TABLE
  resource "aws_route_table" "M_PRIVATE_RT" {
  vpc_id = aws_vpc.M_MY_VPC.id
  }


// PUBLIC AND PRIVATE ROUTE TABLE [IG AND NAT]

resource "aws_route" "M_route_public" {
  route_table_id            = aws_route_table.M_PUBLIC_RT.id
  destination_cidr_block    = var.M_destination_cidr
  gateway_id = aws_internet_gateway.this_MY_IGW.id
}


resource "aws_route" "M_route_private" {
  route_table_id            = aws_route_table.M_PRIVATE_RT.id
  destination_cidr_block    =  var.M_destination_cidr
    gateway_id = aws_nat_gateway.M_MY_NAT.id
}

// ROUTE TABLE ASSOCIATION

resource "aws_route_table_association" "M_RTAS_PUBLIC" {
  subnet_id      = aws_subnet.M_public_subnets01.id
  route_table_id = aws_route_table.M_PUBLIC_RT.id
}

resource "aws_route_table_association" "M_RTAS_PRIVATE" {
  subnet_id      = aws_subnet.M_private_subnets01.id
  route_table_id = aws_route_table.M_PRIVATE_RT.id
}