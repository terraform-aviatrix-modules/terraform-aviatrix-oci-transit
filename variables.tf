variable "controller_ip" {
  default = ""
}

variable "username" {
  default = ""
}

variable "password" {
  default = ""
}

variable "oci_region" {
  description = "The OCI region where the Transit VCN and gateways will be provisioned in."
  type        = string
  default     = "us-ashburn-1"
}

variable "oci_transit_cidr" {
  description = "The CIDR block of the VCN."
  type        = string
  default     = "10.2.0.0/16"
}

variable "oci_account_name" {
  description = "The OCI Access Account name defined in the Aviatrix Controller."
  type        = string
  default     = "TM-OCI"
}

variable "oci_gw_size" {
  description = "The compute instance shape size for the Aviatrix gateways."
  type        = string
  default     = "VM.Standard2.2"
}
