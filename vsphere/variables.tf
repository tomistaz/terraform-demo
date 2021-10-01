# Good to know, vsphere_user.url is plain ip or domain name, no "http://"
variable "vsphere_user" {
    description = "VSphere account"
    type = map(string)
    sensitive = true
}