

# EKS Cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  # role_arn = aws_iam_role.eks_cluster_role.arn
    role_arn = var.eks_cluster_role_arn
  vpc_config {
    # vpc_id = module.vpc.project_vpc_id
    subnet_ids         = var.public_subnet_cidrs
    security_group_ids = [var.security_group_id]
  }

  tags = var.eks-tags
}
