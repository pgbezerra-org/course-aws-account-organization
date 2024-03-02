provider "tfe" {
  organization = "pgbezerra-courses"
  token        = var.tfe_token
}

provider "aws" {
  region = "us-west-1"

  default_tags {
    tags = {
      Terraform          = true
      TerraformWorkspace = terraform.workspace
    }
  }
}
