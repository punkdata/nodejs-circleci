terraform {
  required_version = "~>0.12"
  backend "remote" {
    organization = "datapunks"
    workspaces {
      name = "nodejs-circleci-kubernetes"
    }
  }
}

# terraform {
#   backend "local" {
#    path = "terraform.tfstate"
#   }
# }

provider "kubernetes" {  
}