module "proxy_subnet" {
  source = "../../../modules/networking/subnet"

  vpc_id       = aws_vpc.prod.id
  subnet_cidrs = ["10.84.0.0/24"]
  name_prefix  = "prod__proxy__"
  public_ip    = true
}

module "app_subnet" {
  source = "../../../modules/networking/subnet"

  vpc_id       = aws_vpc.prod.id
  subnet_cidrs = ["10.84.5.0/24"]
  name_prefix  = "prod__app__"
  public_ip    = false
}

module "public_routing" {
  source = "../../../modules/networking/routing"

  name       = "prod__public__rt"
  vpc_id     = aws_vpc.prod.id
  subnet_ids = module.proxy_subnet.ret_subnets.*.id

  routes = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }
  ]
}

module "private_routing" {
  source = "../../../modules/networking/routing"

  name       = "prod__private__rt"
  vpc_id     = aws_vpc.prod.id
  subnet_ids = module.app_subnet.ret_subnets.*.id

  routes = [
    {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.ngw.id
    }
  ]
}
