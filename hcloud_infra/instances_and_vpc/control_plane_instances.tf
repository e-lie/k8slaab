resource "hcloud_server" "control_planes" {
  count = var.control_plane_num
  name  = "k8s-control-plane-${count.index}"

  image       = "ubuntu-20.04"
  server_type = var.control_plane_instance_type

  ssh_keys = [hcloud_ssh_key.id_stagiaire.id]
  labels = {
    provisioner = "terraform",
    engine      = "k8s",
    node_type   = "control-plane"
  }
}

resource "hcloud_server_network" "control_planes" {
  count     = var.control_plane_num
  subnet_id = hcloud_network_subnet.k8s_nodes.id
  server_id = hcloud_server.control_planes[count.index].id
  ip        = cidrhost(hcloud_network_subnet.k8s_nodes.ip_range, 1 + count.index)
}
