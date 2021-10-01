data "intersight_organization_organization" "my_org" {
}

output "intersight_organization" {
  value = data.intersight_organization_organization.my_org.results[0].name
}

