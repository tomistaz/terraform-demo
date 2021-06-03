terraform {
    required_providers {
        intersight = {
            source = "CiscoDevNet/intersight"
            version = "1.0.3"
        }
        aci = {
            source = "CiscoDevNet/aci"
            version = "0.7.0"
        }
        vsphere = {
            version = "2.0.0"
        }
    }
} 
    provider "intersight" {
        apikey = var.intersight_account.api_key
        secretkey = var.intersight_account.api_secret
        endpoint = var.intersight_account.url
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

    # provider "vsphere" {
    #     user = var.vsphere_user.username
    #     password = var.vsphere_user.password
    #     vsphere_server = var.vsphere_user.url
    #     allow_unverified_ssl = true
    # }
