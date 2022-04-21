#Transit VPC
resource "aviatrix_vpc" "default" {
  cloud_type   = 16
  name         = local.name
  region       = var.region
  cidr         = var.cidr
  account_name = var.account
}

#Transit GW
resource "aviatrix_transit_gateway" "default" {
  cloud_type                       = 16
  vpc_reg                          = var.region
  gw_name                          = local.name
  gw_size                          = var.instance_size
  vpc_id                           = aviatrix_vpc.default.vpc_id
  account_name                     = var.account
  subnet                           = local.subnet
  ha_subnet                        = var.ha_gw ? local.ha_subnet : null
  ha_gw_size                       = var.ha_gw ? var.instance_size : null
  connected_transit                = var.connected_transit
  bgp_manual_spoke_advertise_cidrs = var.bgp_manual_spoke_advertise_cidrs
  enable_learned_cidrs_approval    = var.learned_cidr_approval
  enable_segmentation              = var.enable_segmentation
  single_az_ha                     = var.single_az_ha
  single_ip_snat                   = var.single_ip_snat
  enable_advertise_transit_cidr    = var.enable_advertise_transit_cidr
  bgp_polling_time                 = var.bgp_polling_time
  bgp_ecmp                         = var.bgp_ecmp
  insane_mode                      = var.insane_mode
  local_as_number                  = var.local_as_number
  enable_bgp_over_lan              = var.enable_bgp_over_lan
  tunnel_detection_time            = var.tunnel_detection_time
  enable_multi_tier_transit        = var.enable_multi_tier_transit
  learned_cidrs_approval_mode      = var.learned_cidrs_approval_mode
  availability_domain              = aviatrix_vpc.default.availability_domains[0]
  fault_domain                     = aviatrix_vpc.default.fault_domains[0]
  ha_availability_domain           = var.ha_gw ? aviatrix_vpc.default.availability_domains[1] : null
  ha_fault_domain                  = var.ha_gw ? aviatrix_vpc.default.fault_domains[1] : null
}
