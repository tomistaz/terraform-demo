terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = "0.7.0"
    }
  }
}
provider "aci" {
  # APIC Username
  username = var.aci_user.username
  # APIC Password
  password = var.aci_user.password
  # APIC URL
  url      = var.aci_user.url
  insecure = true
}
