module "vcn" {
  source           = "../modules/vcn"
  compartment_ocid = var.compartment_ocid
}

module "instance" {
  source           = "../modules/instance"
  compartment_ocid = var.compartment_ocid
  public_subnet    = module.vcn.public_subnet
  ssh_key          = var.ssh_key
  shape            = var.shape
  memory_in_gbs    = var.memory_in_gbs
  ocpus            = var.ocpus
  boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
  boot_volume_vpus_per_gb = var.boot_volume_vpus_per_gb
}
