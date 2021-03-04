# Query list of AZs
data "aws_availability_zones" "available" {}

locals {
  az_list  = data.aws_availability_zones.available.zone_ids
  az_count = length(local.az_list)
}

resource "aws_subnet" "mysubnet" {
  count = length(var.subnet_cidrs)

  vpc_id               = var.vpc_id
  availability_zone_id = local.az_list[count.index % local.az_count]
  cidr_block           = var.subnet_cidrs[count.index]

  map_public_ip_on_launch         = var.public_ip
  assign_ipv6_address_on_creation = var.ipv6

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}${local.az_list[count.index % local.az_count]}"
    }
  )
}
