terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = "1.0.3"
    }
  }
}
provider "intersight" {
  apikey    = var.intersight_account.api_key
  secretkey = var.intersight_account.api_secret
  endpoint  = var.intersight_account.url
}
