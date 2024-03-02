terraform {
  cloud {
    organization = "pgbezerra-courses"
    workspaces {
      tags = ["aws-account", "automatically-generated"]
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
