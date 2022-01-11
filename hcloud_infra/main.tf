

variable "digitalocean_token" {
  sensitive = true
}

variable "hcloud_token" {
  sensitive = true
}

variable "cluster_basedomain" {
  default = "dopl.uk"
}

variable "cluster_subdomain" {
  default = "k8slaab"
}


module "instances_and_vpc" {
  source                  = "./instances_and_vpc"
  htoken                         = var.hcloud_token
  dotoken                         = var.digitalocean_token
  ssh_key                       = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBXHgv6fDeMM/zbqXpzdANeNbltG74+2Q1pBC9CXRc0M stagiaire-id"
  workers_instance_type         = "cx21"
  control_plane_instance_type         = "cx21"
  cluster_basedomain = var.cluster_basedomain
  cluster_subdomain = var.cluster_subdomain
}


# Uncomment when cluster + argocd ready

# module "argocd_cluster" {
#   source                  = "./argocd_cluster"
#   depends_list = [module.cluster_basic_setup.depends_on]
#   cluster_basedomain = var.cluster_basedomain
#   cluster_subdomain = var.cluster_subdomain
# }