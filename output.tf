data "intersight_organization_organization" "my_org" {
}

output "intersight_organization" {
  value = data.intersight_organization_organization.my_org.results[0].name
}

data "aci_system" "my_syst" {
  pod_id = "1"
  system_id = "1"
}

output "aci_system" {
    value = data.aci_system.my_syst.version
}

# data "vsphere_datacenter" "vsph_dc" {
#     name = "DCTeam1"
# }

# output "vshere_dc_name" {
#     value = data.vsphere_datacenter.vsph_dc.name
# }