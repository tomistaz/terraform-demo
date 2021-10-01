terraform {
  required_providers {
    vsphere = {
      version = "2.0.0"
    }
  }
}
provider "vsphere" {
  user                 = var.vsphere_user.username
  password             = var.vsphere_user.password
  vsphere_server       = var.vsphere_user.url
  allow_unverified_ssl = true
  #client_debug         = true
}
