variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "A list of IDs of the public subnets"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "A list of IDs of the private subnets"
  type        = list(string)
}

# variable "internet_gateway_id" {
#   description = "The ID of the internet gateway for the public route table"
#   type        = string
#   default = null
# }

# variable "nat_gateway_id" {
#   description = "The ID of the NAT gateway for the private route table (optional)"
#   type        = string
#   default     = null
# }

# variable "create_nat_gateway" {
#   description = "Flag to determine if NAT gateway should be used for private subnets"
#   type        = bool
#   default     = false
# }

variable "public_route_table_name" {
  description = "Name for the public route table"
  type        = string
  default     = "public-route-table"
}

variable "private_route_table_name" {
  description = "Name for the private route table"
  type        = string
  default     = "private-route-table"
}
