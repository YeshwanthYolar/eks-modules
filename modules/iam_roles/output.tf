# output "iam-role-name" {
#     description = "the name of the iam-role"
#     value = aws_iam_role.eks_cluster_role 
# }

output "eks_cluster_role_arn" {
    description = "the arn of eks cluster role of iam"
    value = aws_iam_role.eks_cluster_role.arn
}

output "node_group_role_arn" {
    description = "the arn of eks cluster role of iam"
    value = aws_iam_role.node_group_role.arn
}

output "iam-policy-attached_1" {
    description = "the policy attached to cluster"
    value = aws_iam_role_policy_attachment.eks_cluster_policy.policy_arn
}
output "iam-policy-attached_2" {
    description = "the policy attached to cluster"
    value = aws_iam_role_policy_attachment.eks_cluster_policy
}