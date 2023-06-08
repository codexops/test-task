resource "oci_core_subnet" "public_subnet_india_west" {
  display_name    = "oracle-testnet-vcn-india-west-public-subnet1"
  dns_label       = "oraclepublic1"
  cidr_block      = "172.16.0.0/20"
  compartment_id  = var.compartment_ocid
  vcn_id          = oci_core_vcn.india_west_vcn.id
  dhcp_options_id = oci_core_dhcp_options.dhcp_options.id
  route_table_id  = oci_core_route_table.public_route_table.id
}

resource "oci_core_subnet" "private_subnet_india_west" {
  display_name               = "oracle-testnet-vcn-india-west-private-subnet1"
  dns_label                  = "oracleprivate1"
  cidr_block                 = "172.16.16.0/20"
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_vcn.india_west_vcn.id
  dhcp_options_id            = oci_core_dhcp_options.dhcp_options.id
  route_table_id             = oci_core_route_table.private_route_table.id
  prohibit_internet_ingress  = true
  prohibit_public_ip_on_vnic = true
}
