resource "oci_core_nat_gateway" "nat_gateway" {
  display_name   = "oracle-testnet-vcn-india-west-nat-gateway"
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.india_west_vcn.id
  public_ip_id   = oci_core_public_ip.nat_gateway_reserved_ip.id
}
