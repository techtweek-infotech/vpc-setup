resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "vpc"
  }
}
#VPC's Default Security Group
resource "aws_security_group" "stage" {
  name        = "vpc_sg"
  description = "Security group to allow inbound/outbound from the VPC"
  vpc_id      = "${aws_vpc.vpc.id}"
  depends_on  = [aws_vpc.vpc]
  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }
  
  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = "true"
  }
}

#public subnet
resource "aws_subnet" "public-subnets" {
  depends_on = [
    aws_vpc.vpc,
  ]

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability-zone-list
}

#internet gateway
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id
}

#route table
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
 
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = "${aws_internet_gateway.ig.id}"
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public-subnets.*.id}"
  route_table_id = "${aws_route_table.public.id}"
}

