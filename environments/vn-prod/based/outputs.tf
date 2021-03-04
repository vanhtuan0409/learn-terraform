output "ret_vpc" {
  description = "Return VPC"
  value       = aws_vpc.prod
}

output "proxy_subnets" {
  description = "Proxy subnets"
  value       = module.proxy_subnet.ret_subnets
}

output "app_subnets" {
  description = "Proxy subnets"
  value       = module.app_subnet.ret_subnets
}

output "igw" {
  description = "Internet gateway"
  value       = aws_internet_gateway.igw
}

output "ngw" {
  description = "NAT gateway"
  value       = aws_nat_gateway.ngw
}

output "sg_base" {
  description = "Default based Security Group"
  value       = aws_security_group.sg_base
}
