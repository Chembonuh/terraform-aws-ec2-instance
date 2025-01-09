terraform {
  required_version = ">= 1.3.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "chem"

    workspaces {
      name = "ibm"
    }
  }
}

module "pi_instance" {
  source  = "terraform-ibm-modules/powervs-instance/ibm"
  version = "2.3.0"

  pi_workspace_guid          = var.pi_workspace_guid
  pi_ssh_public_key_name     = var.pi_ssh_public_key_name
  pi_image_id                = var.pi_image_id
  pi_networks                = var.pi_networks
  pi_instance_name           = var.pi_instance_name
  pi_sap_profile_id          = var.pi_sap_profile_id
  pi_server_type             = var.pi_server_type
  pi_number_of_processors    = var.pi_number_of_processors
  pi_memory_size             = var.pi_memory_size
  pi_cpu_proc_type           = var.pi_cpu_proc_type
  pi_boot_image_storage_pool = var.pi_boot_image_storage_pool
  pi_boot_image_storage_tier = var.pi_boot_image_storage_tier
  pi_replicants              = var.pi_replicants
  pi_placement_group_id      = var.pi_placement_group_id
  pi_storage_config          = var.pi_storage_config
}
