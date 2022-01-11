provider "digitalocean" {
  token = var.dotoken
}

provider "hcloud" {
  token = var.htoken
}

resource "hcloud_ssh_key" "id_stagiaire" {
  name       = "K3S hcloud - Provisionning SSH key"
  public_key = var.ssh_key
}