terraform {
  cloud {
    organization = "pgbezerra-courses"
    workspaces {
      project = "organization"
      name    = "aws-organization"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.52.0"
    }
  }
}
