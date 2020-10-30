variable "name" {
  description = "Provide a custom name for VPC and Gateway resources."
  default     = ""
  type        = string
}

variable "region" {
  description = "The OCI region to deploy this module in"
  type        = string
}

variable "cidr" {
  description = "The CIDR range to be used for the VPC"
  type        = string
}

variable "account" {
  description = "The OCI account name, as known by the Aviatrix controller"
  type        = string
}

# Optional
variable "instance_size" {
  description = "OCI Instance size for the Aviatrix gateways"
  type        = string
  default     = "VM.Standard2.2"
}

variable "ha_gw" {
  description = "Boolean to determine if module will be deployed in HA or single mode"
  type        = bool
  default     = true
}

variable "connected_transit" {
  description = "Enables Aviatrix connected transit"
  type        = bool
  default     = true
}

variable "bgp_manual_spoke_advertise_cidrs" {
  description = "Define a list of CIDRs that should be advertised via BGP."
  type        = string
  default     = ""
}

variable "learned_cidr_approval" {
  description = "Set to true to enable learned CIDR approval."
  type        = string
  default     = "false"
}

variable "active_mesh" {
  description = "Set to false to disable active mesh."
  type        = bool
  default     = true
}

variable "single_ip_snat" {
  description = "Enable single_ip mode Source NAT for this container"
  type        = bool
  default     = false
}

variable "enable_segmentation" {
  description = "Enable transit gateway for segmentation"
  type        = bool
  default     = false
}

variable "enable_advertise_transit_cidr" {
  description = "Switch to enable/disable advertise transit VPC network CIDR for a VGW connection"
  type        = bool
  default     = false
}

variable "enable_firenet" {
  description = "Sign of readiness for FireNet connection"
  type        = bool
  default     = false
}

variable "enable_transit_firenet" {
  description = "Sign of readiness for Transit FireNet connection"
  type        = bool
  default     = false
}

variable "enable_egress_transit_firenet" {
  description = "Enable Egress Transit FireNet"
  type        = bool
  default     = false
}
variable "bgp_polling_time" {
  description = "BGP route polling time. Unit is in seconds"
  type        = string
  default     = "50"
}

variable "bgp_ecmp" {
  description = "Enable Equal Cost Multi Path (ECMP) routing for the next hop"
  type        = bool
  default     = false
}