resource "aws_vpc" "vpc1" {
  cidr_block     = "10.0.0.0/16"
  
  tags = {
    Name = "redvpc"
     }
  }


resource "aws_subnet" "private"{
    cidr_block           = "10.0.1.0/24"
    vpc_id               = aws_vpc.vpc1.id
    availability_zone_id = "use1-az1"
}

resource "aws_subnet" "public"{
    cidr_block           = "10.0.2.0/24"
    vpc_id               = aws_vpc.vpc1.id
    availability_zone_id = "use1-az2"
}

# Internet Gateway for the public subnet
resource "aws_internet_gateway" "redigw" {
  vpc_id = aws_vpc.vpc1.id
}


resource "aws_route_table" "main" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.redigw.id
  }

  tags = {
    Name = "mainrt"
  }
}

resource "aws_route_table_association" "route-subnet1" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.main.id
}

