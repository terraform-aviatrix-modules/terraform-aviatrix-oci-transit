#Transit VPC
resource "aviatrix_vpc" "default" {
  cloud_type   = 16
  name         = length(var.name) > 0 ? "avx-${var.name}-transit" : replace(lower("avx-${var.region}-transit"), " ", "-")
  region       = var.region
  cidr         = var.cidr
  account_name = var.account
}

# Single Transit GW
resource "aviatrix_transit_gateway" "single" {
  count                            = var.ha_gw ? 0 : 1
  enable_active_mesh               = var.active_mesh
  cloud_type                       = 16
  vpc_reg                          = var.region
  gw_name                          = length(var.name) > 0 ? "avx-${var.name}-transit" : replace(lower("avx-${var.region}-transit"), " ", "-")
  gw_size                          = var.instance_size
  vpc_id                           = aviatrix_vpc.default.name
  account_name                     = var.account
  subnet                           = aviatrix_vpc.default.subnets[0].cidr
  connected_transit                = var.connected_transit
  bgp_manual_spoke_advertise_cidrs = var.bgp_manual_spoke_advertise_cidrs
  enable_learned_cidrs_approval    = var.learned_cidr_approval
  single_ip_snat                   = var.single_ip_snat
  enable_segmentation              = var.enable_segmentation
  enable_advertise_transit_cidr    = var.enable_advertise_transit_cidr
  #enable_firenet                   = var.enable_firenet
  #enable_transit_firenet           = var.enable_transit_firenet
  #enable_egress_transit_firenet    = var.enable_egress_transit_firenet
  bgp_polling_time = var.bgp_polling_time
  bgp_ecmp         = var.bgp_ecmp
}

# HA Transit GW
resource "aviatrix_transit_gateway" "ha" {
  count                            = var.ha_gw ? 1 : 0
  enable_active_mesh               = var.active_mesh
  cloud_type                       = 16
  vpc_reg                          = var.region
  gw_name                          = length(var.name) > 0 ? "avx-${var.name}-transit" : replace(lower("avx-${var.region}-transit"), " ", "-")
  gw_size                          = var.instance_size
  vpc_id                           = aviatrix_vpc.default.name
  account_name                     = var.account
  subnet                           = aviatrix_vpc.default.subnets[0].cidr
  ha_subnet                        = aviatrix_vpc.default.subnets[0].cidr
  ha_gw_size                       = var.instance_size
  connected_transit                = var.connected_transit
  bgp_manual_spoke_advertise_cidrs = var.bgp_manual_spoke_advertise_cidrs
  enable_learned_cidrs_approval    = var.learned_cidr_approval
  single_ip_snat                   = var.single_ip_snat
  enable_segmentation              = var.enable_segmentation
  enable_advertise_transit_cidr    = var.enable_advertise_transit_cidr
  #enable_firenet                   = var.enable_firenet
  #enable_transit_firenet           = var.enable_transit_firenet
  #enable_egress_transit_firenet    = var.enable_egress_transit_firenet
  bgp_polling_time = var.bgp_polling_time
  bgp_ecmp         = var.bgp_ecmp
}