locals {
  tfc_workspace_accounts = {
    for k, v in local.accounts : k => v if lookup(v, "tfc_workspace", true)
  }
}

# A dedicated project for each AWS account
resource "tfe_project" "aws_account" {
  for_each = local.tfc_workspace_accounts
  name     = "aws-${each.key}"
}

resource "tfe_workspace" "aws_account" {
  for_each = local.tfc_workspace_accounts

  name      = "aws-account-${each.key}"
  tag_names = ["aws-account", "automatically-generated", each.key]

  working_directory = "workspaces/aws-account"
  project_id        = data.tfe_project.organization.id

  vcs_repo {
    oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
    identifier     = "pgbezerra-org/course-aws-account-organization"
  }
}

data "tfe_oauth_client" "client" {
  service_provider = "github"
  organization     = data.tfe_organization.organization.name
}

resource "tfe_variable" "account_name" {
  for_each = local.tfc_workspace_accounts

  workspace_id = tfe_workspace.aws_account[each.key].id

  key      = "aws_account_name"
  value    = each.key
  category = "terraform"
}

resource "tfe_variable" "aws_account_id" {
  for_each = local.tfc_workspace_accounts

  workspace_id = tfe_workspace.aws_account[each.key].id

  key      = "aws_account_id"
  value    = aws_organizations_account.all[each.key].id
  category = "terraform"
}

resource "tfe_variable" "aws_account_role_name" {
  for_each = local.tfc_workspace_accounts

  workspace_id = tfe_workspace.aws_account[each.key].id

  key      = "aws_account_role_name"
  value    = aws_organizations_account.all[each.key].role_name
  category = "terraform"
}

resource "tfe_variable" "tfe_account_project_id" {
  for_each = local.tfc_workspace_accounts

  workspace_id = tfe_workspace.aws_account[each.key].id

  key      = "tfe_account_project"
  value    = tfe_project.aws_account[each.key].name
  category = "terraform"
}
