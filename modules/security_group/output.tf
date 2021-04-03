output "arqus_dq_dev_ssh_sg_id" {
  description = "argus dq dev bastion host ssh security group id"
  value       = module.security_group.this_security_group_id

}

output "argus_dq_dev_mariadb_security_group_id" {
  description = "argus dq dev mariadb security group id"
  value       = module.security_group.this_security_group_id
}


output "argus_dq_dev_bastion_sg_id" {
  description = "argus dq dev bastion security group id"
  value       = module.security_group.this_security_group_id
}


output "argus_dq_dev_db_sg_id" {
  description = "argus dq dev bastion security group id"
  value       = module.security_group.this_security_group_id
}

output "argus_dq_dev_ssh_sg_id" {
  description = "argus dg dev ssh security group id"
  value       = module.security_group.this_security_group_id

}

output "argus_dq_dev_opeldap_security_group_id" {
  description = "argus dg dev openldap security group id"
  value       = module.security_group.this_security_group_id
}
