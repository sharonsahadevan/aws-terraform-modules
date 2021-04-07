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
    "name"                                      = "${var.app_name}_${var.environment}_vpc"
    "environment"                               = var.environment
    "project"                                   = var.app_name
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

# module "eks_devops_assumable_roles" {
#   source                     = "./modules/iam_assumable_roles"
#   readonly_role_name         = var.devops_readonly_role_name
#   account_id                 = var.account_id
#   create_readonly_role       = var.create_readonly_role
#   readonly_role_requires_mfa = var.readonly_role_requires_mfa
#   force_detach_policies      = var.force_detach_policies


# }

# module "eks" {
#   source                                         = "./modules/eks"
#   account_id                                     = var.account_id // sensitive variable
#   cluster_name                                   = var.cluster_name
#   cluster_version                                = var.cluster_version
#   subnets                                        = module.vpc.private_subnets
#   vpc_id                                         = module.vpc.vpc_id
#   enable_irsa                                    = var.enable_irsa
#   cluster_endpoint_public_access                 = var.cluster_endpoint_public_access
#   cluster_endpoint_private_access                = var.cluster_endpoint_private_access
#   cluster_create_endpoint_private_access_sg_rule = var.cluster_create_endpoint_private_access_sg_rule
#   cluster_endpoint_private_access_cidrs          = var.cluster_endpoint_private_access_cidrs
#   cluster_endpoint_public_access_cidrs           = var.cluster_endpoint_public_access_cidrs
#   tags                                           = var.eks_tags
#   map_roles = [
#     {
#       rolearn  = "${module.eks_devops_assumable_roles.readonly_iam_role_arn}"
#       username = "devops-user"
#       groups   = ["system:masters"]
#     },
#   ]
#   workers_group_defaults = var.workers_group_defaults
#   worker_groups = [
#     {
#       name                          = "${var.worker_group1_name}"
#       instance_type                 = "${var.worker_group1_instance_type}"
#       asg_desired_capacity          = var.worker_group1_asg_capacity
#       additional_security_group_ids = [module.eks_wg_one_sg.eks_wg_one_sg_id]
#     },
#     {
#       name                          = "${var.worker_group2_name}"
#       instance_type                 = "${var.worker_group2_instance_type}"
#       asg_desired_capacity          = var.worker_group2_asg_capacity
#       additional_security_group_ids = [module.eks_wg_two_sg.eks_wg_two_sg_id]
#     },
#     {
#       name                          = "${var.worker_group3_name}"
#       instance_type                 = "${var.worker_group3_instance_type}"
#       asg_desired_capacity          = var.worker_group3_asg_capacity
#       additional_security_group_ids = [module.eks_wg_three_sg.eks_wg_three_sg_id]
#     },

#   ]
# }

# # eks management node 1
# module "eks_wg_one_sg" {
#   source                   = "./modules/security_group"
#   vpc_id                   = module.vpc.vpc_id
#   name                     = var.eks_wg_one_sg_name
#   description              = var.eks_wg_one_sg_description
#   egress_cidr_blocks       = var.eks_wg_one_sg_egress_cidr_blocks
#   egress_rules             = var.eks_wg_one_sg_egress_rules
#   ingress_with_cidr_blocks = var.ingress_with_cidr_blocks

# }

# # eks management node 2
# module "eks_wg_two_sg" {
#   source                   = "./modules/security_group"
#   vpc_id                   = module.vpc.vpc_id
#   name                     = var.eks_wg_two_sg_name
#   description              = var.eks_wg_two_sg_description
#   egress_cidr_blocks       = var.eks_wg_two_sg_egress_cidr_blocks
#   egress_rules             = var.eks_wg_two_sg_egress_rules
#   ingress_with_cidr_blocks = var.ingress_with_cidr_blocks

# }


# # eks management node 3
# module "eks_wg_three_sg" {
#   source                   = "./modules/security_group"
#   vpc_id                   = module.vpc.vpc_id
#   name                     = var.eks_wg_three_sg_name
#   description              = var.eks_wg_three_sg_description
#   egress_cidr_blocks       = var.eks_wg_three_sg_egress_cidr_blocks
#   egress_rules             = var.eks_wg_three_sg_egress_rules
#   ingress_with_cidr_blocks = var.ingress_with_cidr_blocks

# }

# alb
# module "alb" {
#   source = "./modules/alb"
#   name   = var.name
#   #name_prefix = var.name_prefix
#   # access_logs                      = var.access_logs // need to enable after S3 bucket is created. Refer the README.md for more information
#   subnets                          = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
#   vpc_id                           = module.vpc.vpc_id
#   create_lb                        = var.create_lb
#   drop_invalid_header_fields       = var.drop_invalid_header_fields
#   enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
#   enable_deletion_protection       = var.enable_deletion_protection
#   enable_http2                     = var.enable_http2
#   extra_ssl_certs                  = var.extra_ssl_certs
#   http_tcp_listeners               = var.http_tcp_listeners
#   https_listener_rules             = var.https_listener_rules
#   https_listeners                  = var.https_listeners
#   idle_timeout                     = var.idle_timeout
#   internal                         = var.internal
#   ip_address_type                  = var.ip_address_type
#   lb_tags                          = var.lb_tags
#   listener_ssl_policy_default      = var.listener_ssl_policy_default
#   load_balancer_create_timeout     = var.load_balancer_create_timeout
#   load_balancer_delete_timeout     = var.load_balancer_delete_timeout
#   security_groups                  = var.security_groups
#   tags                             = var.alb_tags
#   target_group_tags                = var.target_group_tags
#   target_groups                    = var.target_groups


# }


# RDS

module "db" {
  source                          = "./modules/rds"
  create_cluster                  = true
  name                            = var.rds_name
  engine                          = var.rds_engine
  engine_version                  = var.rds_engine_version
  instance_type                   = var.rds_instance_type
  instance_type_replica           = var.rds_instance_type_replica
  vpc_id                          = module.vpc.vpc_id
  db_subnet_group_name            = module.vpc.database_subnet_group_name
  create_security_group           = var.rds_create_security_group
  allowed_cidr_blocks             = var.rds_allowed_cidr_blocks
  replica_count                   = var.rds_replica_count
  replica_scale_enabled           = var.rds_replica_scale_enabled
  replica_scale_min               = var.rds_replica_scale_min
  replica_scale_max               = var.rds_replica_scale_max
  monitoring_interval             = var.rds_monitoring_interval
  iam_role_max_session_duration   = var.rds_iam_role_max_session_duration
  apply_immediately               = var.rds_apply_immediately
  skip_final_snapshot             = var.rds_skip_final_snapshot
  enabled_cloudwatch_logs_exports = var.rds_enabled_cloudwatch_logs_exports
}


module "redseal_ctp_dev_db_sg" {
  source                   = "./modules/security_group"
  vpc_id                   = module.vpc.vpc_id
  name                     = var.redseal_ctp_dev_db_sg_name
  description              = var.redseal_ctp_dev_db_sg_description
  egress_cidr_blocks       = var.redseal_ctp_dev_db_sg_egress_cidr_blocks
  egress_rules             = var.redseal_ctp_dev_db_sg_egress_rules
  ingress_with_cidr_blocks = var.ingress_with_cidr_blocks

}