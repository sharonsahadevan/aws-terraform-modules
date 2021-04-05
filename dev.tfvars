# common
aws_profile_name          = "sharon-personal" // change it
environment               = "dev"
app_name                  = "redseal_ctp"
terraform_state_file_path = "redseal_dev_terraform_state"
terraform_state_s3_bucket = "redseal_dev_terraform_state_s3"
eb_keypair                = "redseal_dev_eb"
healthcheck_url           = "/"
account_id                = 493223896872

# VPC
region               = "us-west-1"
private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
cidr                 = "10.0.0.0/16"
enable_nat_gateway   = true
single_nat_gateway   = true
enable_dns_hostnames = true
enable_s3_endpoint   = true
vpc_description      = "redseal vpc"
one_nat_gateway_per_az = true


#Bastion host
bastion_instance_name               = "redseal_dev_bastion_host_ec2"
bastion_instance_count              = 1
bastion_instance_ami                = "ami-0e8286b71b81c3cc1"
bastion_instance_type               = "t3.small"
bastion_associate_public_ip_address = true
bastion_key_name                    = "redseal_dev_bastion_key"
bastion_volume_type                 = "gp2"
bastion_volume_size                 = 50
bastion_encrypted                   = false
bastion_iam_instance_profile        = "redseal_dev_bastion_instance_profile"
bastion_user_data                   = "bastion_provisioner.sh"
bastion_disable_api_termination     = false


# bastion security group
bastion_sg_name               = "redseal_dev_bastion_sg"
bastion_sg_description        = "arugus dq dev bastion sg"
bastion_sg_egress_cidr_blocks = ["0.0.0.0/0"]
bastion_sg_egress_rules       = ["all-all"]
ssh_from_port                 = 22
ssh_to_port                   = 22
ssh_sg_protocol               = "tcp"

# ssh security group
ssh_sg_name                                     = "redseal_dev_ssh_sg"
ssh_sg_description                              = "All SSH traffic via port 22"
ssh_sg_ingress_rule_description                 = "Allow SSH ingress traffic on port 22"
ssh_sg_egress_rules                             = ["all-all"]
ssh_number_of_computed_ingress_with_cidr_blocks = 1
ssh_sg_egress_cidr_blocks                       = ["0.0.0.0/0"]
ssh_sg_ingress_with_cidr_blocks = [{
  from_port   = 22,
  to_port     = 22,
  protocol    = "tcp",
  description = "Allow tcp traffic on port 22",
  cidr_blocks = "10.0.0.0/16",
}, ]

# eks_devops_assumable_roles
create_readonly_role = true 
force_detach_policies = true 
readonly_role_requires_mfa = true 
 

#eks
cluster_name = "redseal-dev-eks-test1"
cluster_version = "1.18"
enable_irsa = true
cluster_endpoint_public_access = true 
cluster_endpoint_private_access = true 
cluster_create_endpoint_private_access_sg_rule = true 
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
cluster_endpoint_private_access_cidrs = ["0.0.0.0/0"]
workers_group_defaults = "gp2"

worker_group1_name = "wg-1"
worker_group1_instance_type = "t3.medium"
worker_group1_asg_capacity = 1

worker_group2_name = "wg-2"
worker_group2_instance_type = "t3.medium"
worker_group2_asg_capacity = 1

worker_group3_name = "wg-3"
worker_group3_instance_type = "t3.medium"
worker_group3_asg_capacity = 1

tags = {
  "environment" = "dev"
  "project" = "redseal"
}




  
# eks security groups
# eks worker node group 1
eks_wg_one_sg_name                                            = "redseal_ctp_dev_eks_wg_one_sg"
eks_wg_one_sg_description                                     = "Allow traffic via port 22"
eks_wg_one_sg_egress_cidr_blocks                              = "Allow ingress traffic on port 22"
eks_wg_one_sg_egress_rules                                    = ["all-all"]
eks_wg_one_sg_to_port                                         = 1
eks_wg_one_sg_cidr_blocks                                     = ["0.0.0.0/0"]
ingress_with_cidr_blocks            = [{  
                                                from_port   = 22,
                                                to_port     = 22,
                                                protocol    = "tcp",
                                                description = "Allow tcp traffic on port 22",
                                                cidr_blocks = "10.0.0.0/16",
                                            },]


# eks worker node group 2
eks_wg_two_sg_name                                            = "redseal_ctp_dev_eks_wg_one_sg"
eks_wg_two_sg_description                                     = "Allow traffic via port 22"
eks_wg_two_sg_egress_cidr_blocks                              = "Allow ingress traffic on port 22"
eks_wg_two_sg_egress_rules                                    = ["all-all"]
eks_wg_two_sg_to_port                                         = 1
eks_wg_two_sg_cidr_blocks                                     = ["0.0.0.0/0"]
ingress_with_cidr_blocks            = [{  
                                                from_port   = 22,
                                                to_port     = 22,
                                                protocol    = "tcp",
                                                description = "Allow tcp traffic on port 22",
                                                cidr_blocks = "10.0.0.0/16",
                                            },]


# eks worker node group 3
eks_wg_three_sg_name                                            = "redseal_ctp_dev_eks_wg_one_sg"
eks_wg_three_sg_description                                     = "Allow traffic via port 22"
eks_wg_three_sg_egress_cidr_blocks                              = "Allow ingress traffic on port 22"
eks_wg_three_sg_egress_rules                                    = ["all-all"]
eks_wg_three_sg_to_port                                         = 1
eks_wg_three_sg_cidr_blocks                                     = ["0.0.0.0/0"]
ingress_with_cidr_blocks            = [{  
                                                from_port   = 22,
                                                to_port     = 22,
                                                protocol    = "tcp",
                                                description = "Allow tcp traffic on port 22",
                                                cidr_blocks = "10.0.0.0/16",
                                            },]
