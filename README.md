# Terraform Aviatrix OCI Transit

### Description

This module deploys a VCN and an Aviatrix transit gateway. Defining the Aviatrix Terraform provider is assumed upstream and is not part of this module.

### Diagram
<img src="https://github.com/terraform-aviatrix-modules/terraform-aviatrix-oci-transit/blob/master/img/oci-ha.png?raw=true"  height="250">

with ha_gw set to false, the following will be deployed:

<img src="https://github.com/terraform-aviatrix-modules/terraform-aviatrix-oci-transit/blob/master/img/oci-single.png?raw=true" height="250">

### Usage Example

```
# OCI Transit Module
module "oci_transit_1" {
  source      = "terraform-aviatrix-modules/oci-transit/aviatrix"
  version     = "1.0.0"

  name        = "my-transit"
  cidr        = "10.10.0.0/16"
  region      = "us-ashburn-1"
  account     = "TM-OCI"
}
```

The following variables are required:

key | value
--- | ---
name | avx-\<name\>-transit
region | OCI region to deploy the transit VCN in
account | The OCI account name on the Aviatrix controller, under which the controller will deploy this VCN
cidr | The IP CIDR wo be used to create the VCN.

The following variables are optional:

key | default | value
--- | --- | ---
instance_size | VM.Standard2.2 | Size of the transit gateway instances
ha_gw | true | Set to false te deploy a single transit GW.

Outputs
This module will return the following objects:

key | description
--- | ---
vcn | The created VCN as an object with all of it's attributes. This was created using the aviatrix_vpc resource.
transit_gateway | The created Aviatrix transit gateway as an object with all of it's attributes.