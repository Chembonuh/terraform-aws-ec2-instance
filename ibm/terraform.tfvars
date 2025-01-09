# Region and Zone
region = "us-east"
zone   = "us-east-1"

# IBM Cloud API Key
ibmcloud_api_key = "W2WCo3b1aGHF-V8yjP_LEX4dw_1Sx3D1w6t4Yit35eiN" # From ibm.tf

# Workspace GUID
pi_workspace_guid = "6d54da55fe234b40a6df3ee6a0666679"            # From resource_group in ibm.tf

# SSH Public Key Name
pi_ssh_public_key_name = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCikl9ulbIeAsd718VvwqY973gP7hx6PInznxIuOl5ULJmS7PQ3c0lybSGH0YQDb9rTSFd1ofpdFBY9RVtnRVW3ocAlmUjyyrMJzOc28WDF/rC6duRffvep9wi305B5xYHJ1yySjONlJQBKuZRDWt/yHZDXGII/CevvAh1aTdT4UVQrsR2khBoiFMiaA5YgA+a/T0FVQChuixBToxuk5QKrfq9w/e3yvWfHMxbHaxTAwL3CnMxAl/7/GSVg1h3L5mC9rG4xqZjA15ocsSZt482XEvLYHDJlxMN9EFrDriINpMxuXEg3FJmjv52DVyQKbdf5YLKLgQ65m4hFIzTOe7nf ansible@hub.example.com" # Replace with your SSH public key                  # From ibm.tf: SSH key name

# Image ID
pi_image_id = "IBMi:75-04-2924-1"         # From ibm.tf: Image ID

# Networks
#pi_networks = "41a62bfb-da6a-4e21-8f76-ea6cf5982871"                                     # Replace with your network ID

pi_networks = [
  {
    name = "public-192_168_7_16-28-VLAN_2073"
    id   = "41a62bfb-da6a-4e21-8f76-ea6cf5982871"
  }
]

# Instance Name
pi_instance_name = ["LPAR1", "LPAR2", "LPAR3"]                        # From ibm.tf: Instance name

# SAP Profile ID
pi_sap_profile_id = null                                         # Optional, leave null if unused

# Server Type
pi_server_type ="e980"                                        # Optional, leave null if unused

# Number of Processors
pi_number_of_processors = "1"                                # Optional, leave null if unused

# Memory Size
pi_memory_size = "4"                                          # Optional, leave null if unused

# CPU Processor Type
pi_cpu_proc_type = "shared"                                       # Optional, leave null if unused

# Boot Image Storage Pool
pi_boot_image_storage_pool = "auto-select"                          # Optional, leave null if unused

# Boot Image Storage Tier
pi_boot_image_storage_tier = "tier3"                          # Optional, leave null if unused

# Number of Replicants
pi_replicants = "2"                                         # Optional, leave null if unused

# Placement Group ID
pi_placement_group_id = "52dfbe61-1135-4083-ae4a-921cb136fa41"                             # Optional, leave null if unused

# Existing Volume IDs
pi_existing_volume_ids = []                                    # Optional, leave empty if unused

# Storage Configuration
pi_storage_config = {}                                         # Optional, leave empty if unused

# Instance Initialization for Linux
pi_instance_init_linux = {}                                    # Optional, leave empty if unused

# Network Services Configuration
pi_network_services_config = {}                               # Optional, leave empty if unused


# User Tags
pi_user_tags = {                                               # Optional, customize as needed
  environment = "production"
  owner       = "ansible"
}
