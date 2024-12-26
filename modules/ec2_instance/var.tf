variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
}

# variable "public_subnet_cidrs" {
#   description = "The list of CIDR blocks for public subnets"
#   type        = list(string)
# }

variable "public_subnet_ids" {
  description = "The list of public subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID to associate with the instance"
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

variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
  default     = true
}
