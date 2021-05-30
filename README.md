# Terraform Aviatrix OCI Transit

### Description
This module deploys a VCN and an Aviatrix transit gateway. Defining the Aviatrix Terraform provider is assumed upstream and is not part of this module.

### Compatibility
Module version | Terraform version | Controller version | Terraform provider version
:--- | :--- | :--- | :---
v4.0.4 | 0.13,0.14 | >= 6.4 | >= 2.19
v3.0.1 | 0.13 | >=6.2 | >=2.17
v3.0.0 | 0.13 | >=6.2 | >=2.17
v2.0.0 | 0.12 | >=6.2 | >=2.17
v1.1.1 | 0.12 | | 
v1.1.0 | 0.12 | | 
v1.0.2 | 0.12 | | 
v1.0.1 | 0.12 | |
v1.0.0 | 0.12 | |

### Diagram
<img src="https://github.com/terraform-aviatrix-modules/terraform-aviatrix-oci-transit/blob/master/img/oci-ha-v3.png?raw=true"  height="250">

with ha_gw set to false, the following will be deployed:

<img src="https://github.com/terraform-aviatrix-modules/terraform-aviatrix-oci-transit/blob/master/img/oci-single-v3.png?raw=true" height="250">

### Usage Example

```
# OCI Transit Module
module "oci_transit_1" {
  source      = "terraform-aviatrix-modules/oci-transit/aviatrix"
  version     = "4.0.1"

  cidr        = "10.10.0.0/16"
  region      = "us-ashburn-1"
  account     = "OCI"
}
```

The following variables are required:

key | value
--- | ---
region | OCI region to deploy the transit VCN in
account | The OCI account name on the Aviatrix controller, under which the controller will deploy this VCN
cidr | The IP CIDR wo be used to create the VCN.

The following variables are optional:

key | default | value
--- | --- | ---
name | null | When this string is set, user defined name is applied to all infrastructure supporting n+1 sets within a same region or other customization
instance_size | VM.Standard2.4 | Size of the transit gateway instances
ha_gw | true | Set to false te deploy a single transit GW.
connected_transit | true | Set to false to disable connected_transit
bgp_manual_spoke_advertise_cidrs | | Intended CIDR list to advertise via BGP. Example: "10.2.0.0/16,10.4.0.0/16" 
learned_cidr_approval | false | Switch to true to enable learned CIDR approval
active_mesh | true | Set to false to disable active_mesh
prefix | true | Boolean to enable prefix name with avx-
suffix | true | Boolean to enable suffix name with -transit
enable_segmentation | false | Switch to true to enable transit segmentation
single_az_ha | true | Set to false if Controller managed Gateway HA is desired
single_ip_snat | false | Enable single_ip mode Source NAT for this container
enable_advertise_transit_cidr  | false | Switch to enable/disable advertise transit VPC network CIDR for a VGW connection
bgp_polling_time  | 50 | BGP route polling time. Unit is in seconds
bgp_ecmp  | false | Enable Equal Cost Multi Path (ECMP) routing for the next hop
insane_mode | false | Enable insane mode high performance encryption
local_as_number | null | Changes the Aviatrix Transit Gateway ASN number before you setup Aviatrix Transit Gateway connection configurations
enable_bgp_over_lan | false | Enable BGp over LAN. Creates eth4 for integration with SDWAN for example
tunnel_detection_time | null | The IPsec tunnel down detection time for the Spoke Gateway in seconds. Must be a number in the range [20-600]
enable_multi_tier_transit | false | Set to true to enable multi tier transit
learned_cidrs_approval_mode | null | Learned cidrs approval mode. Defaults to Gateway. Valid values: gateway, connection
 
Outputs
This module will return the following objects:

key | description
--- | ---
vcn | The created VCN as an object with all of it's attributes. This was created using the aviatrix_vpc resource.
transit_gateway | The created Aviatrix transit gateway as an object with all of it's attributes.