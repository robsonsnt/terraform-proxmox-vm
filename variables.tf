variable "pm_api_url" {
  description = "Proxmox API URL"
}

variable "pm_user" {
  description = "Proxmox user"
}

variable "pm_password" {
  description = "Proxmox password"
}

variable "pm_tls_insecure" {
  description = "Whether to ignore TLS verification"
  default     = true
}

variable "count_vms" {
  description = "Number of VMs to create"
  default     = 1
}

variable "ip_addresses" {
  description = "Map of VM names to IP addresses"
  type        = map(string)
  default     = {}
}

variable "gateway_ip" {
  description = "Gateway IP address"
}

variable "target_node" {
  description = "Target node for the VM"
}

variable "template_clone" {
  description = "Name of the template to clone"
}

variable "full_clone" {
  description = "Whether to perform a full clone"
  default     = true
}

variable "vm_state" {
  description = "State of the VM"
  default     = "stopped"
}

variable "os_type" {
  description = "OS type of the VM"
  default     = "cloud-init"
}

variable "cores" {
  description = "Number of cores"
  default     = 1
}

variable "sockets" {
  description = "Number of sockets"
  default     = 1
}

variable "memory" {
  description = "Memory in MB"
  default     = 1024
}

variable "scsihw" {
  description = "SCSI controller type"
  default     = "virtio-scsi-pci"
}

variable "nameserver" {
  description = "Nameserver IP address"
}

variable "searchdomain" {
  description = "Search domain"
}

variable "ciuser" {
  description = "Cloud-init user"
}

variable "cipassword" {
  description = "Cloud-init password"
}

variable "sshkeys" {
  description = "SSH public keys"
}

variable "cloudinit_cdrom_storage" {
  description = "Storage for the cloud-init CD-ROM"
}

variable "backup" {
  description = "Whether to enable backup"
  default     = true
}

variable "cache" {
  description = "Disk cache mode"
  default     = "none"
}

variable "discard" {
  description = "Whether to enable discard"
  default     = true
}

variable "emulatessd" {
  description = "Whether to emulate an SSD"
  default     = true
}

variable "replicate" {
  description = "Whether to replicate the disk"
  default     = true
}

variable "disk_size" {
  description = "Disk size in GB"
  default     = 15
}

variable "disk_storage" {
  description = "Storage for the disk"
}

variable "network_model" {
  description = "Network model"
  default     = "virtio"
}

variable "network_bridge" {
  description = "Network bridge"
  default     = "vmbr0"
}
