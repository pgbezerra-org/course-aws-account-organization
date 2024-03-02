resource "tfe_project_variable_set" "aws_account_aws_access" {
  project_id      = data.tfe_project.account.id
  variable_set_id = tfe_variable_set.aws_account.id
}
