variable "compartment_ocid" {
  default = "ocid1.compartment.oc1..aaaaaaaakzejmgopyhymaudfpfenrf76yje4f5dx6trcsxt6kq3sq5ckl6ta"
}

variable "india_west_cidr" {
  default = "172.16.0.0/16"
}

variable "oracle_region_ap_mumbai_1" {
  default     = "ap-mumbai-1"
  description = "Oracle Mumbai,India Region"
}

variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2/V6xFcvq5AQxUHaDgS4zsC7KV6F25tMoKwdYCX5KQ1QwoO9assN4DJLaaRqEzRpVnvXy/2Gso5QdjOuAtR/tMafqhTnkZFzmm4MEeE1Oz/f7gedXg4UN2LRCJYVaic6ex0mTYhHJPuCmEouPEUN4WkLrM5NtA4WRCcgUQxfkpMcvb3xtLx2oWPyWeta0POZaXtdsOVK3SkC4YFX5pW75b3JQsjWSQJtQUdzqxpmxpoog+KFWplqO3ZSDZ0KgHaUDaLId9BtNHJVmrRMLR/8AGBNWDnzFb4rtB+SxniGU0+hfgBnExMcbniOBGk/F12FeXdeLNZ21Z3g1ubUnbQgcvMY4DPjjbkytBbM3E/zyvl4gf+0uByUwasOFs203eIrHCJIE8o7hztmW0ZnCUPjJ2Ubk5LVQFdwp6oraMvmeRghPQb2r6D0clXMSnhay6JadtY1XiN+QkPK2zluAsMJ9UEPMNr1BHgeBsj1q3oL/yXaBFlJEF5Vr4whhUIM85Kc= mac@macs-Mac-mini.local"
}

variable "shape" {
  default = "VM.Standard.E2.1.Micro"
}

variable "memory_in_gbs" {
  default = 1
  type = number
}

variable "ocpus" {
  default = 1
  type = number
}

variable "boot_volume_size_in_gbs" {
  default = 100
  type = number
}

variable "boot_volume_vpus_per_gb" {
  default = 10
  type = number
}
