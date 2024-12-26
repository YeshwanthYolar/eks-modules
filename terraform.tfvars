aws_region = "us-east-1"
aws_profile = "default"

vpc_name = "my-vpc"
cidr_block = "10.0.0.0/16"
public_subnet_cidrs =  ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

ami_id ="ami-01816d07b1128cd2d"
key_name = "dockerapp"
instance_name = "my-project-instance"
instance_type = "t2.micro"

iam-role-name = "yesh-cluster-role" # iam role

cluster_name = "yesh-eks-cluster" # eks
eks-tags = {
  Environment = "Production"
  Project     = "EKS-Cluster"
}

node_group_name = "yesh-node-group"   # node-group
node_role_arn = "aws_iam_role.node_group_role.arn"
instance_types = ["t3.medium"]
desired_size = 2
max_size = 3
min_size = 1