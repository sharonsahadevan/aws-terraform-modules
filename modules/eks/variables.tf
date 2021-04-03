variable "vpc_id" {}
variable "subnets" {}
variable "cluster_name" {}
variable "cluster_version"{}
variable "enable_irsa" {}
variable "cluster_endpoint_public_access" {}
variable "cluster_endpoint_private_access" {}
variable "cluster_create_endpoint_private_access_sg_rule" {}
variable "cluster_endpoint_private_access_cidrs" {}
variable "cluster_endpoint_public_access_cidrs" {}
variable "account_id"{}
variable "tags" {
  type = map(string)
}

variable "worker_groups"{
  type = any
}

