module "vm" {
  source = "../../"

  proxmox_endpoint  = var.proxmox_endpoint
  proxmox_api_token = var.proxmox_api_token

  # Common defaults
  node_name        = "carbon"
  clone_vm_id      = 9000
  init_dns_servers = ["8.8.8.8", "8.8.4.4"]
  init_username    = "admin"
  init_ssh_keys    = [var.ssh_public_key]

  # Primary network defaults
  network_primary = {
    gateway = "172.16.2.1"
  }

  # CPU & Memory defaults
  cpu_cores        = 4
  memory_dedicated = 4096

  # Disk defaults
  disk_size         = 40
  disk_datastore_id = "data"

  vms = {
    web-01 = {
      name  = "web-01"
      vm_id = 200
      tags  = ["staging", "web"]
      network_primary = {
        address = "172.16.2.10/24"
      }

      # Additional disk
      disk_additional = [
        {
          size      = 20
          interface = "virtio1"
        }
      ]

      # Additional network interface (NIC + IP config combined)
      network_additional = [
        {
          bridge  = "vmbr1"
          address = "10.0.1.10/24"
        }
      ]
    }

    web-02 = {
      name  = "web-02"
      vm_id = 201
      tags  = ["staging", "web"]
      network_primary = {
        address = "172.16.2.11/24"
      }
    }
  }
}
