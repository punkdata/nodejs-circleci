resource "vault_auth_backend" "approle" {
  type = "approle"
}

resource "vault_policy" "policy" {
  name = var.app

  policy = <<EOT
path "gcp/token/${var.app}" {
  capabilities = ["read"]
}

path "${var.app}" {
  capabilities = ["read"]
}
EOT
}

resource "vault_approle_auth_backend_role" "app" {
  backend            = vault_auth_backend.approle.path
  role_name          = var.app
  token_policies     = [vault_policy.policy.name]
  secret_id_ttl      = 3600
  secret_id_num_uses = 0
  token_num_uses     = 10
  token_ttl          = 3600
  token_max_ttl      = 3600
}

resource "vault_approle_auth_backend_role_secret_id" "app" {
  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.app.role_name
}