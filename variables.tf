#Common
variable "region" {}
variable "aws_profile_name" {}
variable "eb_keypair" {}
variable "healthcheck_url" {}
variable "account_id" {}
variable "stack" {}
variable "organization"{}
variable "application"{}
variable "owner"{}


#VPC
variable "environment" {}
variable "app_name" {}
variable "cidr" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "enable_s3_endpoint" {}
variable "enable_dns_hostnames" {}
variable "enable_nat_gateway" {}
variable "single_nat_gateway" {}
variable "vpc_description" {}
variable "one_nat_gateway_per_az" {}

# eks_devops_assumable_roles
variable "readonly_role_requires_mfa" {}
variable "force_detach_policies" {}
variable "create_readonly_role" {}
variable "devops_readonly_role_name" {}

#eks
variable "cluster_name" {}
variable "cluster_version" {}
variable "enable_irsa" {}
variable "cluster_endpoint_public_access" {}
variable "cluster_endpoint_private_access" {}
variable "cluster_create_endpoint_private_access_sg_rule" {}
variable "cluster_endpoint_private_access_cidrs" {}
variable "cluster_endpoint_public_access_cidrs" {}
variable "workers_group_defaults" {}


# worker group 1
variable "worker_group1_name" {
  description = "eks workder node group 1 name"
  type        = string
  default     = "worker-group-1"
}

variable "worker_group1_instance_type" {
  description = "eks worker group 1 instance type"
  type        = string
}


variable "worker_group1_asg_capacity" {
  description = "eks workder group 1 asg node count"
  type        = number
  default     = 1
}


# worker group 2

variable "worker_group2_name" {
  description = "eks workder node group 2 name"
  type        = string
}


variable "worker_group2_instance_type" {
  description = "eks worker group 2 instance type"
  type        = string
}

variable "worker_group2_asg_capacity" {
  description = "eks workder group 2 asg node count"
  type        = number
  default     = 1
}

# worker group 3
variable "worker_group3_name" {
  description = "eks workder node group 2 name"
  type        = string
}


variable "worker_group3_instance_type" {
  description = "eks worker group 2 instance type"
  type        = string
}

variable "worker_group3_asg_capacity" {
  description = "eks workder group 2 asg node count"
  type        = number
  default     = 1
}

variable "root_volume_type" {
  type    = string
  default = "gp2"
}

variable "eks_tags" {
  type    = map(string)
  default = {}

}

# eks security groups
# eks worker node group 1
variable "eks_wg_one_sg_name" {}
variable "eks_wg_one_sg_description" {}
variable "eks_wg_one_sg_egress_cidr_blocks" {}
variable "eks_wg_one_sg_egress_rules" {}
variable "ingress_with_cidr_blocks" {}


# eks worker node group 2
variable "eks_wg_two_sg_name" {}
variable "eks_wg_two_sg_description" {}
variable "eks_wg_two_sg_egress_cidr_blocks" {}
variable "eks_wg_two_sg_egress_rules" {}



# eks worker node group 3
variable "eks_wg_three_sg_name" {}
variable "eks_wg_three_sg_description" {}
variable "eks_wg_three_sg_egress_cidr_blocks" {}
variable "eks_wg_three_sg_egress_rules" {}


# alb

variable "name" {
  type        = string
  description = "The resource name and Name tag of the load balancer."
}

variable "name_prefix" {
  type        = string
  description = "The resource name prefix and Name tag of the load balancer. Cannot be longer than 6 characters"
  default     = ""

}


variable "access_logs" {
  type        = map(string)
  description = "Map containing access logging configuration for load balancer."
  default     = {}
}

variable "create_lb" {
  type        = bool
  description = "Controls if the Load Balancer should be created"

}

variable "drop_invalid_header_fields" {
  type        = bool
  description = "Indicates whether invalid header fields are dropped in application load balancers. Defaults to false"


}

variable "enable_cross_zone_load_balancing" {
  type        = bool
  description = "Indicates whether cross zone load balancing should be enabled in application load balancers."

}

variable "enable_deletion_protection" {
  type        = bool
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false"
}

variable "enable_http2" {
  type        = bool
  description = "Indicates whether HTTP/2 is enabled in application load balancers."
}

variable "extra_ssl_certs" {
  type        = list(map(string))
  description = "A list of maps describing any extra SSL certificates to apply to the HTTPS listeners. Required key/values: certificate_arn, https_listener_index (the index of the listener within https_listeners which the cert applies toward)"
  default     = []

}

variable "http_tcp_listeners" {
  type        = any
  description = "A list of maps describing the HTTP listeners or TCP ports for this ALB. Required key/values: port, protocol. Optional key/values: target_group_index (defaults to http_tcp_listeners[count.index])"
  default     = []
}

variable "https_listener_rules" {
  type        = any
  description = "A list of maps describing the Listener Rules for this ALB. Required key/values: actions, conditions. Optional key/values: priority, https_listener_index (default to https_listeners[count.index])"
  default     = []

}

variable "https_listeners" {
  type        = any
  description = "A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate_arn. Optional key/values: ssl_policy (defaults to ELBSecurityPolicy-2016-08), target_group_index (defaults to https_listeners[count.index])"
  default     = []
}

variable "idle_timeout" {
  type        = number
  description = "The time in seconds that the connection is allowed to be idle."

}

variable "internal" {
  type        = bool
  description = "Boolean determining if the load balancer is internal or externally facing"
  default     = false

}

variable "ip_address_type" {
  type        = string
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
}

variable "lb_tags" {
  type        = map(string)
  description = "A map of tags to add to load balancer"
  default     = {}

}

variable "listener_ssl_policy_default" {
  type        = string
  description = "The security policy if using HTTPS externally on the load balancer. [See](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html)"

}

variable "load_balancer_create_timeout" {
  type        = string
  description = "Timeout value when creating the ALB."

}

variable "load_balancer_delete_timeout" {
  type        = string
  description = "Timeout value when deleting the ALB."

}

variable "load_balancer_type" {
  type        = string
  description = "The type of load balancer to create. Possible values are application or network"

}

variable "security_groups" {
  type        = list(string)
  description = "The security groups to attach to the load balancer. e.g. ['sg-edcd9784','sg-edcd9785']"
  default     = []

}


variable "alb_tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "target_group_tags" {
  type        = map(string)
  description = "A map of tags to add to all target groups"
  default     = {}

}

variable "target_groups" {
  type        = any
  description = "A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend_protocol, backend_port"
  default     = []
}


# RDS

variable "rds_name" {
  type    = string
  default = "redseal_ctp_dev_rds"
}
variable "rds_engine" {
  type    = string
  default = "aurora"
}
variable "rds_engine_version" {
  type    = string
  default = "5.6.10a"
}
variable "rds_instance_type" {
  type = string
}
variable "rds_instance_type_replica" {
  type = string
}

variable "rds_create_security_group" {
  type    = bool
  default = true
}
variable "rds_allowed_cidr_blocks" {
  type    = list(string)
  default = []
}
variable "rds_replica_count" {
  type    = number
  default = 1
}
variable "rds_replica_scale_enabled" {
  type    = bool
  default = true
}
variable "rds_replica_scale_min" {
  type    = number
  default = 2
}
variable "rds_replica_scale_max" {
  type = number
}
variable "rds_monitoring_interval" {
  type    = number
  default = 300

}
variable "rds_iam_role_use_name_prefix" {
  type    = bool
  default = false

}
variable "rds_iam_role_path" {
  type = string
}

variable "rds_iam_role_max_session_duration" {
  type = number
}
variable "rds_apply_immediately" {
  type    = bool
  default = false
}
variable "rds_skip_final_snapshot" {
  type    = bool
  default = true
}
variable "rds_enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "Description: List of log types to export to cloudwatch - `audit`, `error`, `general`, `slowquery`, `postgresql`"
  default     = []

}
variable "rds_db_parameter_group_name" {
  type = string
}
variable "rds_db_cluster_parameter_group_name" {
  type = string
}

# RDS security group

variable "redseal_ctp_dev_db_sg_name" {
  type = string
}

variable "redseal_ctp_dev_db_sg_description" {
  type = string
}

variable "redseal_ctp_dev_db_sg_egress_cidr_blocks" {
  type = list(string)
}

variable "redseal_ctp_dev_db_sg_egress_rules" {
  type = list(string)
}


# ECR

variable "ecr_enabled"{
    type = bool
    default = true
}

variable "ecr_namespace"{
    type = string 

}

variable "ecr_stage"{
    type = string
}

variable "ecr_name"{
    type = string
}

variable "ecr_max_image_count" {
  type = number
}


variable "ecr_image_tag_mutability" {
  type = string
  default = "IMMUTABLE"
  
}