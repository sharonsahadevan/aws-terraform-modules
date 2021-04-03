output "readonly_iam_role_arn" {
  description = "ARN of readonly IAM role"
  value       = element(concat(aws_iam_role.readonly.*.arn, [""]), 0)
}

output "readonly_iam_role_name" {
  description = "Name of readonly IAM role"
  value       = element(concat(aws_iam_role.readonly.*.name, [""]), 0)
}

output "readonly_iam_role_path" {
  description = "Path of readonly IAM role"
  value       = element(concat(aws_iam_role.readonly.*.path, [""]), 0)
}

output "readonly_iam_role_requires_mfa" {
  description = "Whether readonly IAM role requires MFA"
  value       = var.readonly_role_requires_mfa
}