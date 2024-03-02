provider "aws" {
  region = "us-west-1"

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/${var.aws_account_role_name}"
  }

  default_tags {
    tags = {
      Terraform          = true
      TerraformWorkspace = terraform.workspace
    }
  }
}

provider "tfe" {
  organization = "pgbezerra-courses"
  token        = var.tfe_token
}
