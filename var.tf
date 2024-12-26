variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  }

variable "aws_profile" {
  description = "The AWS CLI profile to use (optional)"
  type        = string
  }

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for SSH access"
  type        = string
}

variable "instance_name" {
  description = "The name tag for the instance"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

# variable "subnet_cidrs" {
#   description = "A list of subnet CIDR blocks"
#   type        = list(string)
# }
variable "public_subnet_cidrs" {
  description = "The list of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "The list of CIDR blocks for private subnets"
  type        = list(string)
}

variable "internet_gateway_id" {
  description = "The ID of the NAT gateway for the private route table (optional)"
  type        = string
  default     = null
}
variable "nat_gateway_id" {
  description = "The ID of the NAT gateway for the private route table (optional)"
  type        = string
  default     = null
}

variable "create_nat_gateway" {
  description = "Flag to determine if NAT gateway should be used for private subnets"
  type        = bool
  default     = false
}
# variable "security_group_name" {
#   description = "The name of the security group"
#   type        = string
# }

# iam-role
variable "iam-role-name" {
    description = "the name of the iam role"
    type = string  
}


# eks

variable "cluster_name" {
    description = "this is the name of the cluster"
    type = string
}

variable "eks-tags" {
  description = "the tag for eks"
  type = map(string)
}

# node-group
variable "node_group_name" {
  description = "the name of the node-group"
  type = string
}

variable "node_role_arn" {
  description = "the arn of the node group"
  type = string
}

variable "node_key" {
  description = "key for nodes"
  type = string
  default = "dockerapp"
}

variable "instance_types" {
  description = "node instance type"
  type = list(string)
}

variable "desired_size" {
  description = "key for nodes"
  type = string
}
variable "max_size" {
  description = "key for nodes"
  type = string
}
variable "min_size" {
  description = "key for nodes"
  type = string
}