resource "vault_mount" "app" {
  path = var.app
  type = "generic"
}

resource "vault_generic_secret" "kubernetes" {
  path = "${vault_mount.app.path}/pipeline/kubernetes"

  data_json = <<EOT
{
  "project": "${data.google_project.project.project_id}",
  "cluster": "${var.kubernetes_cluster}",
  "zone": "${var.kubernetes_cluster_zone}"
}
EOT
}


resource "vault_generic_secret" "tfc" {
  path = "${vault_mount.app.path}/pipeline/tfc"

  data_json = <<EOT
{
  "token": "${var.terraform_cloud_token}"
}
EOT
}