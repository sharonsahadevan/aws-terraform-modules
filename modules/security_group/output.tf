output "eks_wg_one_sg_id" {
  description = "argus dq dev bastion host ssh security group id"
  value       = module.security_group.this_security_group_id

}

output "eks_wg_two_sg_id" {
  description = "redseal ctp dev mariadb security group id"
  value       = module.security_group.this_security_group_id
}


output "eks_wg_three_sg_id" {
  description = "redseal ctp dev bastion security group id"
  value       = module.security_group.this_security_group_id
}

output "redseal_ctp_dev_db_sg_id"{
  description = "redseal ctp dev rds security group id"
  value = module.security_group.this_security_group_id
}

output "redseal_ctp_dev_db_sg_name"{
  description = "Tredseal ctp dev rds security group name"
  value = module.security_group.this_security_group_name
}