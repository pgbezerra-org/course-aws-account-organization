output "tfc_role_arn" {
  description = "AWS role to assume to run Terraform Cloud workspaces."
  value       = aws_iam_role.tfc_role.arn
}
