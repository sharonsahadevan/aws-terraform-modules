#Common
variable "region" {}
variable "aws_profile_name" {}
variable "eb_keypair" {}
variable "healthcheck_url" {}
variable "account_id" {}

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
variable "one_nat_gateway_per_az"{}


#eks
variable "cluster_name" {}
variable "cluster_version"{}
variable "enable_irsa" {}
variable "cluster_endpoint_public_access" {}
variable "cluster_endpoint_private_access" {}
variable "cluster_create_endpoint_private_access_sg_rule" {}
variable "cluster_endpoint_private_access_cidrs" {}
variable "cluster_endpoint_public_access_cidrs" {}

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
  type = "string"
  default = "gp2"
}

variable "tags" {
  type = map(string)
  
}