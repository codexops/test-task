resource "oci_core_vcn" "india_west_vcn" {
  display_name   = "oracle-testnet-vcn-india-west"
  compartment_id = var.compartment_ocid
  dns_label      = "oracleindiawest"
  cidr_block     = "172.16.0.0/16"
}
