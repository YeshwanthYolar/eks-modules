output "eks_cluster_name" {
    description = "the name of the eks-cluster"
   value = aws_eks_cluster.eks_cluster.name
}

