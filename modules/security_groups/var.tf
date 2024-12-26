variable "vpc_id" {
  description = "The ID of the VPC to associate with the security group"
  type        = string
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "allowed_ssh_cidr_blocks" {
  description = "The CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"] # Change this to restrict SSH access
}
