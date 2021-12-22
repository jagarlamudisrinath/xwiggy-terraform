resource "aws_vpc" "xwiggy_vpc" {
  cidr_block   = var.vpc_cidr_block
  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "public_subnet-1" {
  cidr_block = var.public_subnet_cidr_block_1
  vpc_id = aws_vpc.xwiggy_vpc.id
  availability_zone = var.availability_zone_1
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet-2" {
  cidr_block = var.public_subnet_cidr_block_2
  vpc_id = aws_vpc.xwiggy_vpc.id
  availability_zone = var.availability_zone_2
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.environment}-public-subnet-2"
  }
}

resource "aws_subnet" "private_subnet-1" {
  cidr_block = var.private_subnet_cidr_block_1
  availability_zone = var.availability_zone_1
  vpc_id = aws_vpc.xwiggy_vpc.id
    tags = {
    Name = "${var.environment}-private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet-2" {
  cidr_block = var.private_subnet_cidr_block_2
  availability_zone = var.availability_zone_2
  vpc_id = aws_vpc.xwiggy_vpc.id
    tags = {
    Name = "${var.environment}-private-subnet-2"
  }
}

resource "aws_internet_gateway" "vpc_internet_gateway" {
  vpc_id = aws_vpc.xwiggy_vpc.id
  tags = {
    Name = "${var.environment}-igw"
  }
}

resource "aws_eip" "nat-gateway-elastic-ip" {
  tags = {
    Name = "${var.environment}-ngw-eip"
  }
}

resource "aws_nat_gateway" "vpc_nat_gateway" {
  allocation_id = aws_eip.nat-gateway-elastic-ip.id
  subnet_id = aws_subnet.public_subnet-1.id
  tags = {
    Name = "${var.environment}-ngw"
  }
}

resource "aws_default_route_table" "public-route-table" {
  default_route_table_id = aws_vpc.xwiggy_vpc.default_route_table_id
  tags = {
    Name = "${var.environment}-public-route-table"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_internet_gateway.id
  }
}
resource "aws_route_table_association" "public-route-table-association-1" {
  route_table_id = aws_default_route_table.public-route-table.id
  subnet_id      = aws_subnet.public_subnet-1.id
}

resource "aws_route_table_association" "public-route-table-association-2" {
  route_table_id = aws_default_route_table.public-route-table.id
  subnet_id      = aws_subnet.public_subnet-2.id
}
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.xwiggy_vpc.id
  tags = {
    Name = "${var.environment}-private-route-table"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.vpc_nat_gateway.id
  }
}

resource "aws_route_table_association" "private-route-table-association-1" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private_subnet-1.id
}

resource "aws_route_table_association" "private-route-table-association-2" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private_subnet-2.id
}

output "vpc_id" {
  value = aws_vpc.xwiggy_vpc.id
}

output "public_subnet_id_1" {
  value = aws_subnet.public_subnet-1.id
}

output "public_subnet_id_2" {
  value = aws_subnet.public_subnet-2.id
}
output "private_subnet_id_1" {
  value = aws_subnet.private_subnet-1.id
}

output "private_subnet_id_2" {
  value = aws_subnet.private_subnet-2.id
}
