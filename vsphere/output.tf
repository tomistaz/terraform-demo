data "vsphere_datacenter" "vsph_dc" {
  name = "DCTeam1"
}

output "vshere_dc_name" {
  value = data.vsphere_datacenter.vsph_dc.name
}
