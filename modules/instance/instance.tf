resource "oci_core_instance" "test" {
  availability_domain = data.oci_identity_availability_domains.india_west.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  display_name        = "test-instance"
  metadata = {
    ssh_authorized_keys = var.ssh_key
    user_data = "${base64encode(file("${path.module}/BNBSetup.sh"))}"
  }
  
  shape = var.shape
  create_vnic_details {
    assign_public_ip = "true"
    subnet_id        = var.public_subnet
  }

  shape_config {
    memory_in_gbs = var.memory_in_gbs
    ocpus         = var.ocpus
  }

  source_details {
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
    boot_volume_vpus_per_gb = var.boot_volume_vpus_per_gb
    source_id               = data.oci_core_images.ubuntu.images.0.id
    source_type             = "image"
  }

  preserve_boot_volume = false
}
