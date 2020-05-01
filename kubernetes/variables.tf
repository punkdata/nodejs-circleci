variable "app" {
  type        = string
  default     = "nodejs-circleci"
  description = "Name of application"
}

variable "image" {
  type        = string
  default     = "ariv3ra/nodejs-circleci:latest"
  description = "Container image and tag"
}

variable "service_type" {
  type        = string
  default     = "LoadBalancer"
  description = "Type of service to create for application"
}