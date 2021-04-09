

Terraform module to provision an [`AWS ECR Docker Container registry`](https://aws.amazon.com/ecr/).

## Security & Compliance [<img src="https://cloudposse.com/wp-content/uploads/2020/11/bridgecrew.svg" width="250" align="right" />](https://bridgecrew.io/)

Security scanning is graciously provided by Bridgecrew. Bridgecrew is the leading fully hosted, cloud-native solution providing continuous Terraform security and compliance.

| Benchmark | Description |
|--------|---------------|
| [![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-ecr/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-ecr&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |
| [![CIS KUBERNETES](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-ecr/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-ecr&benchmark=CIS+KUBERNETES+V1.5) | Center for Internet Security, KUBERNETES Compliance |
| [![CIS AWS](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-ecr/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-ecr&benchmark=CIS+AWS+V1.2) | Center for Internet Security, AWS Compliance |
| [![CIS AZURE](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-ecr/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-ecr&benchmark=CIS+AZURE+V1.1) | Center for Internet Security, AZURE Compliance |
| [![PCI-DSS](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-ecr/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-ecr&benchmark=PCI-DSS+V3.2) | Payment Card Industry Data Security Standards Compliance |
| [![NIST-800-53](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-ecr/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-ecr&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![ISO27001](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-ecr/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-ecr&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![SOC2](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-ecr/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-ecr&benchmark=SOC2)| Service Organization Control 2 Compliance |
| [![CIS GCP](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-ecr/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-ecr&benchmark=CIS+GCP+V1.1) | Center for Internet Security, GCP Compliance |
| [![HIPAA](https://www.bridgecrew.cloud/badges/github/cloudposse/terraform-aws-ecr/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=cloudposse%2Fterraform-aws-ecr&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |



## Usage

Also, because of a bug in the Terraform registry ([hashicorp/terraform#21417](https://github.com/hashicorp/terraform/issues/21417)),
the registry shows many of our inputs as required when in fact they are optional.
The table below correctly indicates which inputs are required.


The module creates one or more Elastic Container Registry (ECR) repositories. All repositories created
will share the same configuration. Use this module multiple times to create repositories with
different configurations.

If you provide 1 or more names in `image_names` then one repository will be created for
each of the names you provide. Those names can include "namespaces", which are just
prefixes ending with a slash (`/`).

If you do not provide any names in `image_names`, the module will create a single ECR repo
named `namespace-stage-name` or just `name` depending on the value of `use_fullname`.

Access to the repositories is granted to via the `principals_full_access` and
`principals_readonly_access` lists, which are lists of strings that can designate [any valid AWS
Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying).
This module only creates the Repository Policy allowing those Principals access.
The Principals will still separately need IAM policies allowing them permission
to execute ECR actions against the repository. For more details, see
[How Amazon Elastic Container Registry Works with IAM](https://docs.aws.amazon.com/AmazonECR/latest/userguide/security_iam_service-with-iam.html).

Include this repository as a module in your existing terraform code:

```hcl
# IAM Role to be granted ECR permissions
data "aws_iam_role" "ecr" {
  name = "ecr"
}

module "ecr" {
  source = "cloudposse/ecr/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"
  namespace              = "eg"
  stage                  = "test"
  name                   = "ecr"
  principals_full_access = [data.aws_iam_role.ecr.arn]
}
```

<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tag\_map | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| context | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| enable\_lifecycle\_policy | Set to false to prevent the module from adding any lifecycle policies to any repositories | `bool` | `true` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| encryption\_configuration | ECR encryption configuration | <pre>object({<br>    encryption_type = string<br>    kms_key         = any<br>  })</pre> | `null` | no |
| environment | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| id\_length\_limit | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| image\_names | List of Docker local image names, used as repository names for AWS ECR | `list(string)` | `[]` | no |
| image\_tag\_mutability | The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE` | `string` | `"IMMUTABLE"` | no |
| label\_key\_case | The letter case of label keys (`tag` names) (i.e. `name`, `namespace`, `environment`, `stage`, `attributes`) to use in `tags`.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| label\_order | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| label\_value\_case | The letter case of output label values (also used in `tags` and `id`).<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Default value: `lower`. | `string` | `null` | no |
| max\_image\_count | How many Docker Image versions AWS ECR will store | `number` | `500` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| principals\_full\_access | Principal ARNs to provide with full access to the ECR | `list(string)` | `[]` | no |
| principals\_readonly\_access | Principal ARNs to provide with readonly access to the ECR | `list(string)` | `[]` | no |
| protected\_tags | Name of image tags prefixes that should not be destroyed. Useful if you tag images with names like `dev`, `staging`, and `prod` | `set(string)` | `[]` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| scan\_images\_on\_push | Indicates whether images are scanned after being pushed to the repository (true) or not (false) | `bool` | `true` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| use\_fullname | Set 'true' to use `namespace-stage-name` for ecr repository name, else `name` | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| registry\_id | Registry ID |
| repository\_arn | ARN of first repository created |
| repository\_arn\_map | Map of repository names to repository ARNs |
| repository\_name | Name of first repository created |
| repository\_url | URL of first repository created |
| repository\_url\_map | Map of repository names to repository URLs |

<!-- markdownlint-restore -->

