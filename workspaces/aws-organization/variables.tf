variable "tfe_token" {
  description = <<-EOF
Organization Terraform Cloud Token. It must have permissions to manage
workspaces, variables, and VCS repositories.
Apply and plan operations will not be performed using this token.
EOF
  type        = string
  sensitive   = true
}
