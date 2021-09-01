terraform {
  required_version = "~>0.12"
  backend "remote" {
    organization = "datapunks"
    workspaces {
      name = "nodejs-circleci-k8s"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}