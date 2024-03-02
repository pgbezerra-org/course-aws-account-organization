data "tfe_project" "organization" {
  organization = data.tfe_organization.organization.name
  name         = "organization"
}

resource "tfe_workspace" "aws_organization" {
  name       = "aws-organization"
  project_id = data.tfe_project.organization.id
  tag_names  = ["aws-management-account", "automatically-generated"]
}
