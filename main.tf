# Aviatrix OCI Transit VPC
resource "aviatrix_vpc" "oci_transit_vcn" {
  cloud_type   = 16
  name         = "av-${var.oci_region}-transit-vcn"
  region       = var.oci_region
  cidr         = var.oci_transit_cidr
  account_name = var.oci_account_name
}

# Aviatrix OCI Transit Network Gateway with HA
# Gateways will be automatically deployed in seperate OCI Fault Domains
resource "aviatrix_transit_gateway" "oci_transit_gateway" {
  cloud_type         = 16
  account_name       = var.oci_account_name
  gw_name            = "${var.oci_region}-transit"
  vpc_id             = aviatrix_vpc.oci_transit_vcn.name
  vpc_reg            = var.oci_region
  gw_size            = var.oci_gw_size
  subnet             = aviatrix_vpc.oci_transit_vcn.subnets[0].cidr
  ha_subnet          = aviatrix_vpc.oci_transit_vcn.subnets[0].cidr
  ha_gw_size         = var.oci_gw_size
  enable_active_mesh = true
  connected_transit  = true
}
