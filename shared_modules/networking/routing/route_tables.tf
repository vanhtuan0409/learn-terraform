resource "aws_route_table" "my_route_table" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}

resource "aws_route" "my_routes" {
  count = length(var.routes)

  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = var.routes[count.index].cidr_block

  gateway_id                = lookup(var.routes[count.index], "gateway_id", null)
  instance_id               = lookup(var.routes[count.index], "instance_id", null)
  nat_gateway_id            = lookup(var.routes[count.index], "nat_gateway_id", null)
  local_gateway_id          = lookup(var.routes[count.index], "local_gateway_id", null)
  transit_gateway_id        = lookup(var.routes[count.index], "transit_gateway_id", null)
  vpc_peering_connection_id = lookup(var.routes[count.index], "vpc_peering_connection_id", null)

  depends_on = [aws_route_table.my_route_table]
}

resource "aws_route_table_association" "my_route_table_association" {
  count = length(var.subnet_ids)

  subnet_id      = var.subnet_ids[count.index]
  route_table_id = aws_route_table.my_route_table.id
}
