terraform {
    required_providers {
        intersight = {
            source = "CiscoDevNet/intersight"
            version = "1.0.3"
        }
        aci = {
            source = "CiscoDevNet/aci"
        }
        vcenter = {

        }
    }
    provider "intersight" {
        apikey = var.intersight_account.api_key
        secretkey = var.intersight_account.api_secret
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
}