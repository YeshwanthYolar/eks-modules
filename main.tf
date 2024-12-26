data "aws_availability_zones" "available" {}
module "ec2_instance" {
  source              = "./modules/ec2_instance"
  ami_id              = var.ami_id 
  instance_type       = var.instance_type
  public_subnet_ids   = module.subnets.public_subnet_ids
  security_group_id   = module.security_group.security_group_id
  key_name            = var.key_name
  instance_name       = var.instance_name
  associate_public_ip = true
}


module "security_group" {
  source                = "./modules/security_groups"
  vpc_id                = module.vpc.project_vpc_id
  security_group_name   = "allow-ssh-http-all"
  allowed_ssh_cidr_blocks = ["0.0.0.0/0"] # Restrict to your trusted IPs
}


module "vpc" {
  source      = "./modules/vpc"
  vpc_name    = var.vpc_name
  cidr_block  = var.cidr_block
}

module "subnets" {
  source              = "./modules/subnet"
  vpc_id              = module.vpc.project_vpc_id
  # public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  # private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  pub_subnet_names    = ["public-subnet-1", "public-subnet-2"]
  priv_subnet_names   = ["private-subnet-1", "private-subnet-2"]
}


module "routetables" {
  source               = "./modules/route_table"
  vpc_id               = module.vpc.project_vpc_id
  public_subnet_ids    = module.subnets.public_subnet_ids
  private_subnet_ids   = module.subnets.private_subnet_ids
  # internet_gateway_id  = var.internet_gateway_id
  # nat_gateway_id       = var.nat_gateway_id
  # create_nat_gateway   = true # Set to false if NAT is not required
  public_route_table_name  = "my-public-route-table"
  private_route_table_name = "my-private-route-table"
}

module "iam-role" {
   source = "./modules/iam_roles"
    iam-role-name = "yesh-cluster-role"
    
}

module "eks_cluster" {
  source  = "./modules/eks"  # Submodule path
  eks_cluster_role_arn = module.iam-role.eks_cluster_role_arn
  cluster_name       = var.cluster_name
  public_subnet_cidrs = module.subnets.public_subnet_ids
  security_group_id   = module.security_group.security_group_id
   eks-tags            = var.eks-tags
}

module "eks_node_group" {
  source = "./modules/nodegroup"

  cluster_name             = var.cluster_name
  node_group_name          = var.node_group_name
  node_role_arn            = module.iam-role.node_group_role_arn
  # public_subnet_cidrs      = var.public_subnet_cidrs
   public_subnet_cidrs = module.subnets.public_subnet_ids
  source_security_group_ids = [module.security_group.security_group_id]
  node_key                 = var.node_key
  desired_size             = var.desired_size
  max_size                 = var.max_size
  min_size                 = var.min_size
  instance_types           = var.instance_types       
}
