data "aws_organizations_organization" "current" {}

data "tfe_project" "organization" {
  name = "organization"
}

data "tfe_organization" "organization" {
  name = "pgbezerra-courses"
}

data "tfe_variable_set" "organization" {
  name = "organization-access"
}
