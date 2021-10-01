variable "vsphere_user" {
    description = "VSphere account"
    type = map(string)
    sensitive = true
}