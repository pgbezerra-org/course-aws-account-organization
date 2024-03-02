module "tfc_access" {
  source            = "../../modules/tfc_access"
  aws_tfc_condition = ["project:${data.tfe_project.account.name}:workspace:*:run_phase:*"]
}

resource "tfe_variable_set" "aws_account" {
  name        = "AWS ${var.aws_account_name} account"
  description = "AWS account access environment variables"
}

resource "tfe_variable" "enable_aws_provider_auth" {
  variable_set_id = tfe_variable_set.aws_account.id

  key      = "TFC_AWS_PROVIDER_AUTH"
  value    = "true"
  category = "env"

  description = "Enable the Workload Identity integration for AWS."
}

resource "tfe_variable" "tfc_aws_role_arn" {
  variable_set_id = tfe_variable_set.aws_account.id

  key      = "TFC_AWS_RUN_ROLE_ARN"
  value    = module.tfc_access.tfc_role_arn
  category = "env"

  description = "The AWS role arn runs will use to authenticate."
}
