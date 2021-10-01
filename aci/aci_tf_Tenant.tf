resource "aci_tenant" "demo_tenant" {
  description = "Tenant created for a Terraform demo"
  name        = var.tenant_name
}

resource "aci_vrf" "demo_vrf" {
  tenant_dn = aci_tenant.demo_tenant.id
  name      = var.vrf_name
}

resource "aci_bridge_domain" "demo_bd" {
  tenant_dn          = aci_tenant.demo_tenant.id
  description        = "Bridge domain used for terraform demo"
  name               = var.bd_name
  relation_fv_rs_ctx = aci_vrf.demo_vrf.id
}

resource "aci_subnet" "demo_subnet" {
  parent_dn   = aci_bridge_domain.demo_bd.id
  description = "subnet"
  ip          = var.subnet.ip
  scope       = [var.subnet.scope]
}

resource "aci_application_profile" "demo_ap" {
  tenant_dn = aci_tenant.demo_tenant.id
  name      = var.ap_name
}

resource "aci_application_epg" "demo_epg1" {
  application_profile_dn = aci_application_profile.demo_ap.id
  name                   = var.epg1_name
  description            = "EPG created in order to show the power of Terraform"
  relation_fv_rs_bd      = aci_bridge_domain.demo_bd.id
  relation_fv_rs_cons    = [aci_contract.demo_contract.id]
  #relation_fv_rs_prov    = [aci_contract.demo_contract.id]
}

resource "aci_application_epg" "demo_epg2" {
  application_profile_dn = aci_application_profile.demo_ap.id
  name                   = var.epg2_name
  description            = "EPG created in order to show the power of Terraform"
  relation_fv_rs_bd      = aci_bridge_domain.demo_bd.id
  #relation_fv_rs_cons = [aci_contract.demo_contract.id]
  relation_fv_rs_prov = [aci_contract.demo_contract.id]
}

resource "aci_epg_to_domain" "epg1" {
  application_epg_dn = aci_application_epg.demo_epg1.id
  tdn                = data.aci_vmm_domain.demo_vmmdom.id
  instr_imedcy       = "immediate"
  res_imedcy         = "immediate"
}

resource "aci_epg_to_domain" "epg2" {
  application_epg_dn = aci_application_epg.demo_epg2.id
  tdn                = data.aci_vmm_domain.demo_vmmdom.id
  instr_imedcy       = "immediate"
  res_imedcy         = "immediate"
}

data "aci_vmm_domain" "demo_vmmdom" {
  provider_profile_dn = var.vmm_domain.dn
  name                = var.vmm_domain.name
}

resource "aci_contract" "demo_contract" {
  tenant_dn   = aci_tenant.demo_tenant.id
  description = "Contract to allow ICMP between the two EPGs in order to let a ping through"
  name        = var.contract_name
  scope       = "tenant"
}

resource "aci_contract_subject" "demo_contract_subject" {
  contract_dn = aci_contract.demo_contract.id
  description = "Contract subject"
  name        = var.contract_subject_name
  relation_vz_rs_subj_filt_att = [aci_filter.icmp_filter.id]
}

resource "aci_filter" "icmp_filter" {
  tenant_dn   = aci_tenant.demo_tenant.id
  description = "ICMP filter"
  name        = var.filter_name
}

resource "aci_filter_entry" "demo_filter_entry" {
  filter_dn   = aci_filter.icmp_filter.id
  description = "Filter entry"
  name        = var.filter_entry.name
  ether_t     = "ipv4"
  prot        = var.filter_entry.prot
}
