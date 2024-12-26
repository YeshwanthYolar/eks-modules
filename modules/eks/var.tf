variable "cluster_name" {
    description = "this is the name of the cluster"
    type = string
}

variable "public_subnet_cidrs" {
  description = "The list of CIDR blocks for public subnets"
  type        = list(string)
}
variable "security_group_id" {
    description = "this is the security group id" 
    type = string
}

variable "eks-tags" {
  description = "the tag for eks"
  type = map(string)
}

variable "eks_cluster_role_arn" {
  description = "the arn of eks cluster role"
  
}