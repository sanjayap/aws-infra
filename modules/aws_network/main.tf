resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.env}_vpc"
    Env  = var.env
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}_igw"
    Env  = var.env
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id                  = aws_vpc.vpc.id
  for_each                = var.public_subnets
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet_${each.key}"
    Env  = var.env
  }
}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.env}_public_route"
    Env  = var.env
  }
}

resource "aws_subnet" "private_app_subnets" {
  vpc_id                  = aws_vpc.vpc.id
  for_each                = var.private_app_subnets
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = false
  tags = {
    Name = "private_app_subnet_${each.key}"
    Env  = var.env
  }
}

resource "aws_subnet" "private_db_subnets" {
  vpc_id                  = aws_vpc.vpc.id
  for_each                = var.private_db_subnets
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = false
  tags = {
    Name = "private_db_subnet_${each.key}"
    Env  = var.env
  }
}
