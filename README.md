# Terraform demo pertaining to Cisco DC technologies
Once you have cloned the repository, you will need to create .tfvars file(s) to give values to your variable. 

For string variables, you do:
variable = "value"

For map(string) variables, you do:
main_variable = {
    field_name = "your_name"
    field1 = "value1"
}
