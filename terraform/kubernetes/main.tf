# terraform {
#   required_version = "~>0.12"
#   backend "remote" {
#     organization = "hashicorp-team-demo"
#     workspaces {
#       name = "nodejs-circleci"
#     }
#   }
# }

terraform {
  backend "local" {
   path = "terraform.tfstate"
  }
}

provider "kubernetes" {  
}