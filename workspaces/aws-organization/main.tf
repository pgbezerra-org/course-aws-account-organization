locals {
  root_organizational_unit_id = one(data.aws_organizations_organization.current.roots).id
  organizational_units = {
    management = { parent_id = local.root_organizational_unit_id }
    live       = { parent_id = local.root_organizational_unit_id }
  }

  accounts = {
    course-aws-organization = {
      org_unit_id   = aws_organizations_organizational_unit.all["management"].id
      email         = "bezerra+org_course@pgbezerra.com.br"
      role_name     = null
      tfc_workspace = false
    }
    development = {
      org_unit_id = aws_organizations_organizational_unit.all["live"].id
      workspaces = [
        {
          name              = "dns"
          repo_name         = "course-aws-account-organization"
          working_directory = "workspaces/dns"
          tag_names         = ["test"]
        },
      ]
    }
  }
}
