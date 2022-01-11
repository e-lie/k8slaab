resource "hcloud_server" "workers" {
  count = var.workers_num
  name  = "k8s-worker-${count.index}"

  image       = "ubuntu-20.04"
  server_type = var.workers_instance_type
  location = "hel1"

  ssh_keys = [hcloud_ssh_key.id_stagiaire.id]
  labels = {
    provisioner = "terraform",
    engine      = "k8s",
    # nodepool    = count.index % 3 == 0 ? "gpu" : "general",
  }
}

resource "hcloud_server_network" "workers_network" {
  count     = length(hcloud_server.workers)
  server_id = hcloud_server.workers[count.index].id
  subnet_id = hcloud_network_subnet.k8s_nodes.id
  ip        = cidrhost(hcloud_network_subnet.k8s_nodes.ip_range, 1 + var.control_plane_num + count.index)
}
