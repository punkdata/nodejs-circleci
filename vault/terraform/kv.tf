resource "vault_mount" "app" {
  path = var.app
  type = "generic"
}