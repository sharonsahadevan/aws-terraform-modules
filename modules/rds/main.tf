###########################################################################
# RDS Aurora Module
###########################################################################

locals {
  tags = {
    Name       = "redseal_ctp_dev_rds"
    Environment = "dev"
  }
}

module "aurora" {
  source                          = "terraform-aws-modules/rds-aurora/aws"
  version                          = "4.0.0"
  create_cluster                  = var.create_cluster
  name                            = var.name
  engine                          = var.engine
  engine_version                  = var.engine_version
  instance_type                   = var.instance_type
  instance_type_replica           = var.instance_type_replica
  vpc_id                          = var.vpc_id
  db_subnet_group_name            = var.db_subnet_group_name
  create_security_group           = var.create_security_group
  allowed_cidr_blocks             = var.allowed_cidr_blocks
  replica_count                   = var.replica_count
  replica_scale_enabled           = var.replica_scale_enabled
  replica_scale_min               = var.replica_scale_min
  replica_scale_max               = var.replica_scale_max
  monitoring_interval             = var.monitoring_interval
  iam_role_name                   = "${var.name}-enhanced-monitoring"
  iam_role_use_name_prefix        = var.iam_role_use_name_prefix
  iam_role_description            = "${var.name} RDS enhanced monitoring IAM role"
  iam_role_path                   = var.iam_role_path
  iam_role_max_session_duration   = var.iam_role_max_session_duration
  apply_immediately               = var.apply_immediately
  skip_final_snapshot             = var.skip_final_snapshot
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  db_parameter_group_name         = aws_db_parameter_group.redseal_ctp_db_parameter_group.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.redseal_ctp_rds_cluster_parameter_group.id
  tags                            = local.tags
}

resource "aws_db_parameter_group" "redseal_ctp_db_parameter_group" {
  name_prefix = "${var.name}-aurora-db-postgres11-parameter-group"
  family      = "aurora-postgresql11"
  description = "${var.name}-aurora-db-postgres11-parameter-group"
  tags        = local.tags
}

resource "aws_rds_cluster_parameter_group" "redseal_ctp_rds_cluster_parameter_group" {
  name_prefix = "${var.name}-aurora-postgres-cluster-parameter-group"
  family      = "aurora-postgresql11"
  description = "${var.name}-aurora-postgres-cluster-parameter-group"
  tags        = local.tags
}

# resource "aws_db_subnet_group" "redseal_ctp_dev_rds_db_subnet_group" {
#   name       = "main"
#   subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

#   tags = {
#     Name = "redseal_ctp_dev_rds_subnet_group"
#   }
# }