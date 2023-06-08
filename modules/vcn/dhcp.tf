resource "oci_core_dhcp_options" "dhcp_options" {
  display_name   = "oracle-testnet-vcn-india-west-dhcp-options"
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.india_west_vcn.id

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  options {
    type                = "SearchDomain"
    search_domain_names = [oci_core_vcn.india_west_vcn.vcn_domain_name]
  }
}
