resource "aws_vpc" "prod" {
  cidr_block = "10.84.0.0/16"
  tags = {
    Name = "prod"
  }
}
