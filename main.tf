module "vpc" {
  source                 = "./modules/vpc"
  cidr                   = var.cidr
  app_name               = var.app_name
  environment            = var.environment
  enable_s3_endpoint     = var.enable_s3_endpoint
  enable_dns_hostnames   = var.enable_dns_hostnames
  single_nat_gateway     = var.single_nat_gateway
  enable_nat_gateway     = var.enable_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  private_subnets        = var.private_subnets
  public_subnets         = var.public_subnets
  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "name"        = "${var.app_name}_${var.environment}_vpc"
    "environment" = var.environment
    "project"     = var.app_name
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}

module "eks" {
  source                                         = "./modules/eks"
  account_id                                     = var.account_id
  cluster_name                                   = var.cluster_name
  cluster_version                                = var.cluster_version
  subnets                                        = module.vpc.private_subnets
  vpc_id                                         = module.vpc.vpc_id
  enable_irsa                                    = var.enable_irsa
  cluster_endpoint_public_access                 = var.cluster_endpoint_public_access
  cluster_endpoint_private_access                = var.cluster_endpoint_private_access
  cluster_create_endpoint_private_access_sg_rule = var.cluster_create_endpoint_private_access_sg_rule
  cluster_endpoint_private_access_cidrs          = var.cluster_endpoint_private_access_cidrs
  cluster_endpoint_public_access_cidrs           = var.cluster_endpoint_public_access_cidrs
  tags                                           = var.tags
  worker_groups = [
  {
    name                          = "${var.worker_group1_name}"
    instance_type                 = "${var.worker_group1_instance_type}"
    asg_desired_capacity          = var.worker_group1_asg_capacity
    additional_security_group_ids = [module.eks_wg_one_sg.eks_wg_one_sg_id]
  },
  {
    name                          = "${var.worker_group2_name}"
    instance_type                 = "${var.worker_group2_instance_type}"
    asg_desired_capacity          = var.worker_group2_asg_capacity
    additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
  },
  {
    name                          = "${var.worker_group3_name}"
    instance_type                 = "${var.worker_group3_instance_type}"
    asg_desired_capacity          = var.worker_group3_asg_capacity
    additional_security_group_ids = [aws_security_group.worker_group_mgmt_three.id]
  },
  
]
}


# EKS security groups
# resource "aws_security_group" "worker_group_mgmt_one" {
#   name_prefix = "worker_group_mgmt_one"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     from_port = 22
#     to_port   = 22
#     protocol  = "tcp"

#     cidr_blocks = [
#       "10.0.0.0/8",
#     ]
#   }
# }

# resource "aws_security_group" "worker_group_mgmt_two" {
#   name_prefix = "worker_group_mgmt_two"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     from_port = 22
#     to_port   = 22
#     protocol  = "tcp"

#     cidr_blocks = [
#       "192.168.0.0/16",
#       "10.0.0.0/8",
#     ]
#   }
# }

# resource "aws_security_group" "worker_group_mgmt_three" {
#   name_prefix = "worker_group_mgmt_two"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     from_port = 22
#     to_port   = 22
#     protocol  = "tcp"

#     cidr_blocks = [
#       "192.168.0.0/16",
#       "10.0.0.0/8",
#     ]
#   }
# }


# resource "aws_security_group" "all_worker_mgmt" {
#   name_prefix = "all_worker_management"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     from_port = 22
#     to_port   = 22
#     protocol  = "tcp"

#     cidr_blocks = [
#       "10.0.0.0/8",
#       "172.16.0.0/12",
#       "192.168.0.0/16",
#     ]
#   }
# }


# eks management node 1
module "eks_wg_one_sg" {
  source                    = "./modules/security_group"
  vpc_id                    = module.vpc.vpc_id
  name                      = var.eks_wg_one_sg_name
  description               = var.eks_wg_one_sg_description
  egress_cidr_blocks        = var.eks_wg_one_sg_egress_cidr_blocks
  egress_rules              = var.eks_wg_one_sg_egress_rules
  ingress_with_cidr_blocks  = var.ingress_with_cidr_blocks

}

# eks management node 2
module "eks_wg_two_sg" {
  source                    = "./modules/security_group"
  vpc_id                    = module.vpc.vpc_id
  name                      = var.eks_wg_two_sg_name
  description               = var.eks_wg_two_sg_description
  egress_cidr_blocks        = var.eks_wg_two_sg_egress_cidr_blocks
  egress_rules              = var.eks_wg_two_sg_egress_rules
  ingress_with_cidr_blocks  = var.ingress_with_cidr_blocks

}


# eks management node 3
module "eks_wg_three_sg" {
  source                    = "./modules/security_group"
  vpc_id                    = module.vpc.vpc_id
  name                      = var.eks_wg_three_sg_name
  description               = var.eks_wg_three_sg_description
  egress_cidr_blocks        = var.eks_wg_three_sg_egress_cidr_blocks
  egress_rules              = var.eks_wg_three_sg_egress_rules
  ingress_with_cidr_blocks  = var.ingress_with_cidr_blocks

}
