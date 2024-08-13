terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = var.pm_tls_insecure
}

resource "proxmox_vm_qemu" "vm" {

  count = length(var.ip_addresses)

  name        = keys(var.ip_addresses)[count.index]
  target_node = var.target_node

  clone      = var.template_clone
  full_clone = var.full_clone
  vm_state   = var.vm_state
  os_type    = var.os_type
  cores      = var.cores[count.index]
  sockets    = var.sockets[count.index]
  memory     = var.memory[count.index]
  scsihw     = var.scsihw

  # Cloud-init configuration
  ipconfig0               = "ip=${var.ip_addresses[keys(var.ip_addresses)[count.index]]}/24,gw=${var.gateway_ip}"
  nameserver              = var.nameserver
  searchdomain            = var.searchdomain
  ciuser                  = var.ciuser
  cipassword              = var.cipassword
  sshkeys                 = var.sshkeys

  disks {
    ide {
      ide0 {
        cloudinit {
          storage = var.cloudinit_cdrom_storage
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          backup     = var.backup
          cache      = var.cache
          discard    = var.discard
          emulatessd = var.emulatessd
          replicate  = var.replicate
          size         = "${var.disk_size[count.index]}"
          storage    = var.disk_storage
        }
      }
    }
  }
  network {
    model  = var.network_model
    bridge = var.network_bridge
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
