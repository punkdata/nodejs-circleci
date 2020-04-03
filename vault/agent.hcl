pid_file = "./pidfile"
exit_after_auth = true

auto_auth {
  method "approle" {
    config = {
      role_id_file_path = "vault/role-id"
      secret_id_file_path = "vault/secret-id"
    }
  }

  sink "file" {
    config = {
      path = "/tmp/vault-token"
    }
  }
}

template {
  contents = <<EOF
    {{ with secret "nodejs-circleci/pipeline/dockerhub" }}
    export DOCKER_LOGIN={{ .Data.usr }}
    export DOCKER_PWD={{ .Data.pwd }}
    {{ end }}
  EOF
  destination = "vault/dockerhub"
}

# template {
#   contents = <<EOF
#     {{ with secret "gcp/key/nodejs-circleci" }}
#     {{ .Data.private_key_data }}
#     {{ end }}
#   EOF
#   destination = "/tmp/service-account"
# }

# template {
#   contents = <<EOF
#     {{ with secret "nodejs-circleci/kubernetes" }}
#     {{ .Data.project }}
#     {{ end }}
#   EOF
#   destination = "/tmp/gcp-project"
# }


# template {
#   contents = <<EOF
#     {{ with secret "nodejs-circleci/pipeline/kubernetes" }}
#     {{ .Data.zone }}
#     {{ end }}
#   EOF
#   destination = "/tmp/kubernetes-cluster-zone"
# }

# template {
#   contents = <<EOF
#     {{ with secret "nodejs-circleci/pipeline/kubernetes" }}
#     {{ .Data.cluster }}
#     {{ end }}
#   EOF
#   destination = "/tmp/kubernetes-cluster"
# }

# template {
#   contents = <<EOF
#     {{ with secret "nodejs-circleci/pipeline/kubernetes" }}
#     {{ .Data.zone }}
#     {{ end }}
#   EOF
#   destination = "/tmp/kubernetes-cluster-zone"
# }

# template {
#   contents = <<EOF
#     {{ with secret "nodejs-circleci/pipeline/tfc" }}
#     credentials "app.terraform.io" {
#       token = "{{ .Data.token }}"
#     }
#     {{ end }}
#   EOF
#   destination = "/root/.terraformrc"
# }