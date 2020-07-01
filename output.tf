output "oci_transit_vcn" {
  description = "The full VCN object"
  value       = aviatrix_vpc.oci_transit_vcn
}

output "oci_transit_gateway" {
  description = "The full transit gateway object"
  value       = aviatrix_transit_gateway.oci_transit_gateway
}

output "oci_transit_gw_name" {
  description = "The name of the OCI transit gateway"
  value       = aviatrix_transit_gateway.oci_transit_gateway.gw_name
}