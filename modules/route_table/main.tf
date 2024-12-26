# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.public_route_table_name
  }
}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public_subnets" {
  count          = length(var.public_subnet_ids)
  subnet_id      = element(var.public_subnet_ids, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "my-internet-gateway"
  }
}

# Elastic IPs for NAT Gateways
resource "aws_eip" "nat_eips" {
  count = length(var.public_subnet_ids)
  vpc   = true
}

# NAT Gateways
resource "aws_nat_gateway" "nat_gateways" {
  count         = length(var.public_subnet_ids)
  allocation_id = aws_eip.nat_eips[count.index].id
  subnet_id     = element(var.public_subnet_ids, count.index)  # Use public subnets for NAT Gateways

  tags = {
    Name = "nat-gateway-${count.index + 1}"
  }
}



# Route for Internet Access in Public Route Table
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.private_route_table_name
  }
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private_subnets" {
  count          = length(var.private_subnet_ids)
  subnet_id      = element(var.private_subnet_ids, count.index)
  route_table_id = aws_route_table.private.id
}

# # Route for Internet Access via NAT Gateway in Private Route Table (Optional)
# resource "aws_route" "private" {
#   count                  = var.create_nat_gateway ? 1 : 0
#   route_table_id         = aws_route_table.private.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = var.nat_gateway_id
# }
