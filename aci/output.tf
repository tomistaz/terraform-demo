data "aci_system" "my_syst" {
  pod_id = "1"
  system_id = "1"
}

output "aci_system" {
    value = data.aci_system.my_syst.version
}