terraform {
  required_version = "~>0.12"
  backend "remote" {
    organization = "hashicorp-team-demo"
    workspaces {
      name = "nodejs-circleci-vault"
    }
  }
}

provider "google" {
  version = "~> 3.15"
}

provider "vault" {
  version = "~> 2.9"
}

data "google_project" "project" {}