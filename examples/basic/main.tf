module "vm" {
  source = "../../"

  proxmox_endpoint  = var.proxmox_endpoint
  proxmox_api_token = var.proxmox_api_token

  init_gateway = "172.16.2.1"

  vms = {
    web-01 = {
      name       = "web-01"
      vm_id      = 110
      ip_address = "172.16.2.10/24"
      tags       = ["dev", "web"]
    }
  }
}
