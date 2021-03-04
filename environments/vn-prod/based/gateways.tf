resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prod.id
  tags = {
    Name = "prod-igw"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
  depends_on = [
    aws_internet_gateway.igw
  ]
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = module.proxy_subnet.ret_subnets[0].id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    Name = "prod-ngw"
  }
}
