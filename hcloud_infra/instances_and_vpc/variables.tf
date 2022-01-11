variable "dotoken" {
  sensitive = true
}

variable "htoken" {
  sensitive = true
}

variable "cluster_subdomain" {
  default = "k3sup"
}

variable "cluster_basedomain" {
  default = "dopl.uk"
}

variable "ssh_key" {
  description = "SSH public Key content needed to provision the instances."
  type        = string
}

variable "control_plane_num" {
  description = "Number of control plane nodes."
  default     = 3
}

variable "workers_num" {
  description = "Number of worker nodes."
  default     = 3
}

variable workers_instance_type {
  description = "HCloud instance type for worker nodes: 'hardware' and features (ceph or not) "
  default     = "cx11"
}

variable control_plane_instance_type {
  description = "HCloud instance type for server nodes: 'hardware' and features (ceph or not) "
  default     = "cx11"
}