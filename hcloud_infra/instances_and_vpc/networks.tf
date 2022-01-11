resource "hcloud_network" "k8s" {
  name     = "k8s-network"
  ip_range = "10.0.0.0/8"
}

resource "hcloud_network_subnet" "k8s_nodes" {
  type         = "server"
  network_id   = hcloud_network.k8s.id
  network_zone = "eu-central"
  ip_range     = "10.254.1.0/24"
}