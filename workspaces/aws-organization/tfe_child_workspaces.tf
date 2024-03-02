locals {
  tfc_child_workspaces = {
    for k, v in local.accounts : k => v if contains(keys(v), "workspaces")
  }

  workspaces = merge([
    for account_name, value in local.tfc_child_workspaces : {
      for workspace in value.workspaces : "${account_name}-${workspace.name}" => {
        account_name      = account_name
        repo_name         = workspace.repo_name
        working_directory = lookup(workspace, "working_directory", null)
        tag_names = concat(
          [account_name, workspace.name],
          lookup(workspace, "tag_names", [])
        )
      }
    } if can(value.workspaces)
  ]...)
}

resource "tfe_workspace" "customized" {
  for_each = local.workspaces

  name              = each.key
  project_id        = tfe_project.aws_account[each.value.account_name].id
  tag_names         = each.value.tag_names
  working_directory = each.value.working_directory
}
