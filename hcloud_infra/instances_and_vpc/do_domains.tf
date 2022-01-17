


data "digitalocean_domain" "cluster_domain" {
  name = var.cluster_basedomain
}

resource "digitalocean_record" "workers_subdomains" {
  count = length(hcloud_server.workers)
  domain = data.digitalocean_domain.cluster_domain.name
  type   = "A"
  name   = "worker${count.index}.${var.cluster_subdomain}"
  value  = element(hcloud_server.workers.*.ipv4_address, count.index)
}


resource "digitalocean_record" "workers_wildcard_subdomains" {
  count = length(hcloud_server.workers)
  domain = data.digitalocean_domain.cluster_domain.name
  type   = "A"
  name   = "*.worker${count.index}.${var.cluster_subdomain}"
  value  = element(hcloud_server.workers.*.ipv4_address, count.index)
}

resource "digitalocean_record" "control_plane_subdomains" {
  count = length(hcloud_server.control_planes)
  domain = data.digitalocean_domain.cluster_domain.name
  type   = "A"
  name   = "control-plane${count.index}.${var.cluster_subdomain}"
  value  = element(hcloud_server.control_planes.*.ipv4_address, count.index)
}


resource "digitalocean_record" "control_plane_wildcard_subdomains" {
  count = length(hcloud_server.control_planes)
  domain = data.digitalocean_domain.cluster_domain.name
  type   = "A"
  name   = "*.control-plane${count.index}.${var.cluster_subdomain}"
  value  = element(hcloud_server.control_planes.*.ipv4_address, count.index)
}