output "role_id" {
  value = vault_approle_auth_backend_role.app.role_id
}

output "secret_id" {
  value     = vault_approle_auth_backend_role_secret_id.app.secret_id
  sensitive = true
}