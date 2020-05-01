terraform {
  required_version = "~>0.12"
  backend "remote" {
    organization = "rosemarycorp"
    workspaces {
      name = "nodejs-circleci"
    }
  }
}

provider "kubernetes" {
  version     = "~> 1.11"
}