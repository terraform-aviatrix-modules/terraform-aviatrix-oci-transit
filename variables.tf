variable "region" {
    description = "The OCI region to deploy this module in"
    type = string
}

variable "cidr" {
    description = "The CIDR range to be used for the VPC"
    type = string
}

variable "oci_account_name" {
    description = "The OCI account name, as known by the Aviatrix controller"
    type = string
}

# Optional
variable "instance_size" {
    description = "OCI Instance size for the Aviatrix gateways"
    type = string
    default = "VM.Standard2.2"
}

variable "ha_gw" {
    description = "Boolean to determine if module will be deployed in HA or single mode"
    type = bool
    default = true
}