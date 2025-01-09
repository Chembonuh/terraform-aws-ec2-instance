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
    source = "terraform-ibm-modules/powervs-instance/ibm"
    version = "2.3.0"

    pi_workspace_guid          = var.pi_workspace_guid
    pi_ssh_public_key_name     = var.pi_ssh_public_key_name
    pi_image_id                = var.pi_image_id
    pi_networks                = var.pi_networks
    pi_instance_name           = var.pi_instance_name
    pi_sap_profile_id          = var.pi_sap_profile_id           #(optional, default null)
    pi_server_type             = var.pi_server_type              #(optional, default null)
    pi_number_of_processors    = var.pi_number_of_processors     #(optional, default null)
    pi_memory_size             = var.pi_memory_size              #(optional, default null)
    pi_cpu_proc_type           = var.pi_cpu_proc_type            #(optional, default check vars)
    pi_boot_image_storage_pool = var.pi_boot_image_storage_pool  #(optional, default null)
    pi_boot_image_storage_tier = var.pi_boot_image_storage_tier  #(optional, default null)
    pi_replicants              = var.pi_replicants               #(optional, default null)
    pi_placement_group_id      = var.pi_placement_group_id       #(optional, default null)
    #pi_existing_volume_ids     = var.pi_existing_volume_ids      #(optional, default null)
    pi_storage_config          = var.pi_storage_config           #(optional, default check vars)
    #pi_instance_init_linux     = var.pi_instance_init_linux      #(optional, default check vars)
    # pi_network_services_config = var.pi_network_services_config  #(optional, default check vars)
    # pi_user_tags               = var.pi_user_tags                #(optional), default null
}
