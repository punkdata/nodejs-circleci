terraform {
  required_version = "~>0.12"
}

provider "google" {
  version = "~> 3.15"
}

provider "vault" {
  version = "~> 2.9"
}

data "google_project" "project" {}