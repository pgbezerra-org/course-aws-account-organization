terraform {
  cloud {
    organization = "pgbezerra-courses"
    workspaces {
      project = "aws-development"
      tags    = ["dns", "test"]
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }
}
