variable "aws_tfc_condition" {
  description = <<-EOF
The condition to be used in the TFC policy document to allow the role to assume
the role. The organization is automatically added to the condition. But you
should do something like this: `project:my-project-name:workspace:*:run_phase:*`.

You can many conditions.
EOF
  type        = list(string)
}

# variable "aws_provider_name" {
#   description = <<-EOF
# The AWS provider alias name to create the AWS resources in the correct AWS
# account.
# EOF
# }
