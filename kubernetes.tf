data "kubernetes_secret" "ssh_key" {
  metadata {
    name      = var.kubernetes_secret_name
    namespace = var.kubernetes_namespace
  }
}

resource "local_file" "id_rsa" {
  content  = data.kubernetes_secret.ssh_key.data["id_rsa"]
  filename = "${path.module}/files/id_rsa"

}

resource "local_file" "id_rsa_pub" {
  content  = data.kubernetes_secret.ssh_key.data["id_rsa.pub"]
  filename = "${path.module}/files/id_rsa.pub"

}
