data "aws_availability_zones" "available" {}
resource "aws_subnet" "project_public_subnets" {
  count             = 2
  vpc_id            = var.vpc_id
   cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = element(var.pub_subnet_names, count.index)
  }
}

resource "aws_subnet" "project_private_subnets" {
  count             = 2
  vpc_id            = var.vpc_id
  
 cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  
  tags = {
    Name = element(var.priv_subnet_names, count.index)
  }
}



