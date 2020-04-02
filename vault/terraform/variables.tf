variable "app" {
  type        = string
  description = "name of app"
}

variable "credentials_file" {
  type        = string
  description = "location of GCP credentials"
}

variable "kubernetes_cluster" {
  type        = string
  description = "name of cluster to target"
}

variable "kubernetes_cluster_zone" {
  type        = string
  description = "zone of cluster to target"
}

variable "terraform_cloud_token" {
  type        = string
  description = "API Token for Terraform Cloud"
}