variable "aci_user" {
    description = "ACI account"
    type = map(string)
    sensitive = true
}

variable "vmm_domain" {type = map(string)}
variable "tenant_name" {type = string}
variable "vrf_name" {type = string}
variable "bd_name" {type = string}
variable "subnet" {type = map(string)}
variable "ap_name" {type = string}
variable "epg1_name" {type = string}
variable "epg2_name" {type = string}
variable "contract_name" {type = string}
variable "contract_subject_name" {type = string}
variable "filter_name" {type=string}
variable "filter_entry" {type=map(string)}