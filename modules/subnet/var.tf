variable "vpc_id" {
  description = "The ID of the VPC to associate with the subnets"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "The list of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "The list of CIDR blocks for private subnets"
  type        = list(string)
}

variable "pub_subnet_names" {
  description = "The list of names for public subnets"
  type        = list(string)
}

variable "priv_subnet_names" {
  description = "The list of names for private subnets"
  type        = list(string)
}
