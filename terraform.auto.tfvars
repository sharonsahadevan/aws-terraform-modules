# alb
create_lb                        = true
drop_invalid_header_fields       = false
enable_cross_zone_load_balancing = true
enable_deletion_protection       = false
enable_http2                     = true
idle_timeout                     = 60
ip_address_type                  = "ipv4"
listener_ssl_policy_default      = "ELBSecurityPolicy-2016-08"
load_balancer_create_timeout     = "10m"
load_balancer_delete_timeout     = "10m"
load_balancer_type               = "application"
load_balancer_update_timeout     = "10m"


# eks
cluster_version                 = 1.18
enable_irsa                     = true
cluster_endpoint_public_access  = false
cluster_endpoint_private_access = true
workers_group_defaults          = "gp2"

# eks_devops_assumable_roles
create_readonly_role       = true
force_detach_policies      = true
readonly_role_requires_mfa = true


# RDS
rds_engine_version                  = "11.9"
rds_engine                          = "aurora-postgresql"
rds_create_security_group           = true
rds_apply_immediately               = false
rds_skip_final_snapshot             = true
rds_enabled_cloudwatch_logs_exports = []
rds_iam_role_path                   = "/"