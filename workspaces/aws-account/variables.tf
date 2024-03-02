variable "tfe_token" {
  type        = string
  description = <<-EOF
Organization Terraform Cloud Token. It must have permissions to manage
workspaces, variables, and VCS repositories.
Apply and plan operations will not be performed using this token.
EOF
}

variable "aws_account_name" {
  description = "AWS account name"
}

variable "aws_account_id" {
  description = "AWS account ID"
}

variable "aws_account_role_name" {
  description = "AWS organization account ROOT access role name"
}

variable "tfe_account_project" {
  description = "Terraform Cloud project name for the AWS account"
}
