module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "2.16.0"
  name                        = var.instance_name
  instance_count              = var.instance_count
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.security_group_ids
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  user_data                   = file("${path.root}/scripts/${var.user_data}")
  iam_instance_profile        = var.iam_instance_profile
  disable_api_termination     = var.disable_api_termination

  root_block_device = [
    {
      volume_type = "${var.volume_type}"
      volume_size = "${var.volume_size}"
    },
  ]


  ebs_block_device = [
    {
      device_name = "${var.device_name}"
      volume_type = "${var.volume_type}"
      volume_size = var.volume_size
      encrypted   = var.encrypted

    }
  ]


  tags = {
    created_by  = "Terraform"
    name        = "${var.app_name}_${var.environment}_vpc"
    environment = var.environment
    project     = var.app_name
  }
}

