data "aws_availability_zones" "available" {
  state = "available"
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.project_name}-vpc-${terraform.workspace}"
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.available.names

  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets

  create_database_subnet_group = var.create_database_subnet_group

  enable_nat_gateway = var.enable_nat_gateway
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.project_name}-clst-${terraform.workspace}" = "shared"
    "kubernetes.io/role/elb"                         = 1
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/${var.project_name}-clst-${terraform.workspace}" = "shared"
    "kubernetes.io/role/internal-elb"                = 1
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "${var.project_name}-clst-${terraform.workspace}"
  cluster_version = var.k8s_version

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.public_subnets

  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = var.min_node_count
      max_size     = var.max_node_count
      desired_size = var.desired_node_count

      instance_types = var.instance_types
    }
  }
}


module "argocd" {
  source = "./modules/argocd"
  oidc_provider_arn = module.eks.oidc_provider_arn
  cluster_name = module.eks.cluster_name

  depends_on = [ module.eks.cluster_name ]
}

module "rds" {
  source = "./modules/rds"

  db_name               = var.project_name
  identifier = "${var.project_name}-rds-${terraform.workspace}"
  sg_name               = "${var.project_name}-dbsg-${terraform.workspace}"
  cidr_block            = module.vpc.vpc_cidr_block
  database_subnet_group = module.vpc.database_subnet_group
  vpc_id                = module.vpc.vpc_id
}