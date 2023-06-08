resource "oci_core_internet_gateway" "internet_gateway" {
  display_name   = "oracle-testnet-vcn-india-west-internet-gateway"
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.india_west_vcn.id
}
