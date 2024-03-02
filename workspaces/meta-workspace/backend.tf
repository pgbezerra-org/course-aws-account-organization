terraform {
  cloud {
    organization = "pgbezerra-courses"
    workspaces {
      project = "organization"
      name    = "meta-workspace"
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.52.0"
    }
  }
}
