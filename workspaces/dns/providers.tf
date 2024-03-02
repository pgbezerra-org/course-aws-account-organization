provider "aws" {
  region = "us-west-1"

  default_tags {
    tags = {
      Terraform          = true
      TerraformWorkspace = terraform.workspace
    }
  }
}
