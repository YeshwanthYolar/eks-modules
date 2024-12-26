output "instance_id" {
  description = "The ID of the instance"
  value       = module.ec2_instance.instance_id
}

output "public_ip" {
  description = "The public IP address of the instance"
  value       = module.ec2_instance.public_ip
}

output "private_ip" {
  description = "The private IP address of the instance"
  value       = module.ec2_instance.private_ip
}
output "project_vpc_id" {
    description = "the if of project vpc"
    value = module.vpc.project_vpc_id 
}

# eks
output "eks_cluster_name" {
    description = "the name of the eks-cluster"
   value = module.eks_cluster.eks_cluster_name
}

# iam
# output "iam-role-name" {
#     description = "the name of the iam-role"
#     value = aws_iam_role.eks_cluster_role 
# }

output "eks_cluster_role_arn" {
    description = "the arn of eks cluster role of iam"
    # value = aws_iam_role.eks_cluster_role.arn
      value = module.iam-role.eks_cluster_role_arn
}
output "iam-policy-attached_1" {
    description = "the policy attached to cluster"
    value = module.iam-role.iam-policy-attached_1
}
output "iam-policy-attached_2" {
    description = "the policy attached to cluster"
    value = module.iam-role.iam-policy-attached_2
}

output "eks_node_group" {
  description = "node details"
  value = module.eks_node_group.node_group_instance
}

