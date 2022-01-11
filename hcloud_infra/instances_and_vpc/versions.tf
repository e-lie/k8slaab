terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
  required_version = ">= 0.14"
}