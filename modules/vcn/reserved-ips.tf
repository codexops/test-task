resource "oci_core_public_ip" "nat_gateway_reserved_ip" {
  compartment_id = var.compartment_ocid
  display_name   = "nat-gateway-reserved-ip"
  lifetime       = "RESERVED"
}
