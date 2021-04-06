#eks
cluster_name                                   = "redseal-dev-eks-test1"
cluster_version                                = "1.18"
enable_irsa                                    = true
cluster_endpoint_public_access                 = true
cluster_endpoint_private_access                = true
cluster_create_endpoint_private_access_sg_rule = true
cluster_endpoint_public_access_cidrs           = ["0.0.0.0/0"]
cluster_endpoint_private_access_cidrs          = ["0.0.0.0/0"]
workers_group_defaults                         = { root_volume_type = "gp2" }

worker_group1_name          = "wg-1"
worker_group1_instance_type = "t3.medium"
worker_group1_asg_capacity  = 1

worker_group2_name          = "wg-2"
worker_group2_instance_type = "t3.medium"
worker_group2_asg_capacity  = 1

worker_group3_name          = "wg-3"
worker_group3_instance_type = "t3.medium"
worker_group3_asg_capacity  = 1

tags = {
  "environment" = "dev"
  "project"     = "redseal"
}

# eks security groups
# eks worker node group 1
eks_wg_one_sg_name               = "redseal_ctp_dev_eks_wg_one_sg"
eks_wg_one_sg_description        = "Allow traffic via port 22"
eks_wg_one_sg_egress_cidr_blocks = ["0.0.0.0/0"]
eks_wg_one_sg_egress_rules       = ["all-all"]
eks_wg_one_sg_to_port            = 1
eks_wg_one_sg_cidr_blocks        = ["0.0.0.0/0"]
ingress_with_cidr_blocks = [{
  from_port   = 22,
  to_port     = 22,
  protocol    = "tcp",
  description = "Allow tcp traffic on port 22",
  cidr_blocks = "10.0.0.0/16",
}, ]


# eks worker node group 2
eks_wg_two_sg_name               = "redseal_ctp_dev_eks_wg_one_sg"
eks_wg_two_sg_description        = "Allow traffic via port 22"
eks_wg_two_sg_egress_cidr_blocks = ["0.0.0.0/0"]
eks_wg_two_sg_egress_rules       = ["all-all"]
eks_wg_two_sg_to_port            = 1
eks_wg_two_sg_cidr_blocks        = ["0.0.0.0/0"]



# eks worker node group 3
eks_wg_three_sg_name               = "redseal_ctp_dev_eks_wg_one_sg"
eks_wg_three_sg_description        = "Allow traffic via port 22"
eks_wg_three_sg_egress_cidr_blocks = ["0.0.0.0/0"]
eks_wg_three_sg_egress_rules       = ["all-all"]
eks_wg_three_sg_to_port            = 1
eks_wg_three_sg_cidr_blocks        = ["0.0.0.0/0"]