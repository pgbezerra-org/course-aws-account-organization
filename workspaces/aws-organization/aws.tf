resource "aws_organizations_organization" "main" {
  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "all" {
  for_each = local.organizational_units

  name      = each.key
  parent_id = each.value.parent_id
}

resource "aws_organizations_account" "all" {
  for_each = local.accounts

  name      = each.key
  email     = lookup(each.value, "email", "bezerra+course-aws-org-${each.key}@pgbezerra.com.br")
  role_name = lookup(each.value, "role_name", "org-${each.key}-access-role")
  parent_id = each.value.org_unit_id
}

module "tfc_access" {
  source            = "../../modules/tfc_access"
  aws_tfc_condition = ["project:organization:workspace:*:run_phase:*"]
}

resource "tfe_variable" "enable_aws_provider_auth" {
  variable_set_id = data.tfe_variable_set.organization.id

  key      = "TFC_AWS_PROVIDER_AUTH"
  value    = "true"
  category = "env"

  description = "Enable the Workload Identity integration for AWS."
}

resource "tfe_variable" "tfc_aws_role_arn" {
  variable_set_id = data.tfe_variable_set.organization.id

  key      = "TFC_AWS_RUN_ROLE_ARN"
  value    = module.tfc_access.tfc_role_arn
  category = "env"

  description = "The AWS role arn runs will use to authenticate."
}
