terraform {
  required_version = "~>0.12"
  backend "remote" {
    organization = "hashicorp-team-demo"
    workspaces {
      name = "nodejs-circleci"
    }
  }
}

provider "kubernetes" {
  version = "~> 1.11"
}