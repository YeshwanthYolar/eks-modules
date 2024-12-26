variable "cluster_name" {
    description = "this is the name of the cluster"
    type = string
}

variable "public_subnet_cidrs" {
    description = "this is the name of the cluster"
    type = list(string)
}

variable "source_security_group_ids" {
  description = "List of security group IDs allowed to access nodes"
  type        = list(string)
}

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
}

variable "instance_types" {
  description = "node instance type"
  type = list(string)
}

variable "desired_size" {
  description = "key for nodes"
  type = number
}
variable "max_size" {
  description = "key for nodes"
  type = number
}
variable "min_size" {
  description = "key for nodes"
  type = number
}

# variable "subnet_cidrs" {
#   description = "A list of subnet CIDR blocks"
#   type        = list(string)
# }