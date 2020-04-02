resource "vault_gcp_secret_backend" "gcp" {
  credentials               = var.gcp_credentials
  default_lease_ttl_seconds = 600
  max_lease_ttl_seconds     = 1800
}

resource "vault_gcp_secret_roleset" "roleset" {
  backend      = vault_gcp_secret_backend.gcp.path
  roleset      = var.app
  secret_type  = "service_account_key"
  project      = data.google_project.project.project_id
  token_scopes = ["https://www.googleapis.com/auth/cloud-platform"]

  binding {
    resource = "//cloudresourcemanager.googleapis.com/projects/${data.google_project.project.project_id}"

    roles = [
      "roles/container.developer",
    ]
  }
}