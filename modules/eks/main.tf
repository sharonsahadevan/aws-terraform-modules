provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      data.aws_eks_cluster.cluster.name
    ]
  }
}


module "eks" {
  source                                         = "terraform-aws-modules/eks/aws"
  version                                        = "14.0.0"
  cluster_name                                   = var.cluster_name
  cluster_version                                = var.cluster_version
  subnets                                        = var.subnets
  vpc_id                                         = var.vpc_id
  enable_irsa                                    = var.enable_irsa
  cluster_endpoint_public_access                 = var.cluster_endpoint_public_access
  cluster_endpoint_private_access                = var.cluster_endpoint_private_access
  cluster_create_endpoint_private_access_sg_rule = var.cluster_create_endpoint_private_access_sg_rule
  cluster_endpoint_private_access_cidrs          = var.cluster_endpoint_private_access_cidrs
  cluster_endpoint_public_access_cidrs           = var.cluster_endpoint_public_access_cidrs
  tags                                           = var.tags
  worker_groups                                  = var.worker_groups
  workers_group_defaults                         = var.workers_group_defaults
  map_roles                                      = var.map_roles
  

#   workers_group_defaults = {
#     root_volume_type = "gp2"
#   }
#   map_roles = [
#   {
#     rolearn  = "${module.iam_devops-assumable-roles.readonly_iam_role_arn}"
#     username = "devops-user"
#     groups   = ["system:masters"]
#   },
# ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}


module "alb_ingress_iam-assumable-role-with-oidc" {
  source                = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version               = "3.6.0"
  aws_account_id        = var.account_id
  role_name             = "alb-ingress-controller"
  create_role           = true
  force_detach_policies = true
  provider_url          = module.eks.cluster_oidc_issuer_url
  role_policy_arns      = [module.alb_iam_policy.arn]
}


data "template_file" "alb_iam_policy_template" {
  template = file("${path.root}/modules/eks/policy-templates/alb-iam-policy-template.json.tpl")
}

module "alb_iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "3.6.0"
  name    = "DIL_AWS_ALB_INGRESS_POLICY"
  policy  = data.template_file.alb_iam_policy_template.rendered
}

