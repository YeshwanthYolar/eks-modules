# EKS Node Group
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
#   subnet_ids      = aws_subnet.eks_public_subnets[*].id
    subnet_ids      = var.public_subnet_cidrs[*]


  remote_access {
    ec2_ssh_key               = var.node_key  # Specify your key pair name
    source_security_group_ids = var.source_security_group_ids
  }

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

    instance_types = var.instance_types

  tags = {
    Name = "yesh_eks-node-group"
  }
}