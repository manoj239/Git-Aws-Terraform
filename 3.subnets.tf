#resource "aws_subnet" "subnet1-public" {
#  vpc_id            = aws_vpc.default.id
#  cidr_block        = var.public_subnet1_cidr
#  availability_zone = "ap-south-1a"
#  tags = {
#    Name = "${var.vpc_name}-public-subnet-1"
#  }
#}

locals {
  public_subnet_cidrs  = distinct(var.public_subnet_cidrs)
  private_subnet_cidrs = distinct(var.private_subnet_cidrs)
}

resource "aws_subnet" "public-subnets" {
  #count             = 4 # 0,1 , 2
  #count             = length(var.public_subnet_cidrs)
  count  = length(local.public_subnet_cidrs)
  vpc_id = aws_vpc.default.id
  #cidr_block        = element(var.public_subnet_cidrs, count.index)
  cidr_block        = element(local.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.vpc_name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private-subnets" {
  count             = length(local.private_subnet_cidrs)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(local.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
  }
}