output "node_group_instance" {
  description = "node details"
  value = aws_eks_node_group.eks_node_group.id
}

