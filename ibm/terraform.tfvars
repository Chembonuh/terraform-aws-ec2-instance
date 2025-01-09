# Region and Zone
region = "us-east"
zone   = "us-east-1"

# IBM Cloud API Key
ibmcloud_api_key = "W2WCo3b1aGHF-V8yjP_LEX4dw_1Sx3D1w6t4Yit35eiN"

# Workspace GUID
pi_workspace_guid = "4c26798d-1faf-46ba-ac41-83edc5b75de4  "

# SSH Public Key Name
pi_ssh_public_key_name = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCikl9ulbIeAsd718VvwqY973gP7hx6PInznxIuOl5ULJmS7PQ3c0lybSGH0YQDb9rTSFd1ofpdFBY9RVtnRVW3ocAlmUjyyrMJzOc28WDF/rC6duRffvep9wi305B5xYHJ1yySjONlJQBKuZRDWt/yHZDXGII/CevvAh1aTdT4UVQrsR2khBoiFMiaA5YgA+a/T0FVQChuixBToxuk5QKrfq9w/e3yvWfHMxbHaxTAwL3CnMxAl/7/GSVg1h3L5mC9rG4xqZjA15ocsSZt482XEvLYHDJlxMN9EFrDriINpMxuXEg3FJmjv52DVyQKbdf5YLKLgQ65m4hFIzTOe7nf ansible@hub.example.com"

# Image ID
pi_image_id = "d68fdc7e-9a84-495c-aebf-7eb8f2db3d08"

# Networks
pi_networks = [
  {
    name = "public-192_168_7_16-28-VLAN_2073"
    id   = "41a62bfb-da6a-4e21-8f76-ea6cf5982871"
  }
]

# Instance Name
pi_instance_name = "Lpar1"

# Server Type
pi_server_type = "e980"

# Number of Processors
pi_number_of_processors = 1

# Memory Size
pi_memory_size = 4

# CPU Processor Type
pi_cpu_proc_type = "shared"

# Boot Image Storage Pool
pi_boot_image_storage_pool = "auto-select"

# Boot Image Storage Tier
pi_boot_image_storage_tier = "tier3"

# Replication Configuration
pi_replicants = {
  count  = 2
  policy = "none"
}

# Placement Group ID
pi_placement_group_id = "52dfbe61-1135-4083-ae4a-921cb136fa41"

# Storage Configuration
pi_storage_config = [
  {
    name  = "filesystem1"
    size  = "100"
    count = "1"
    tier  = "tier1"
    mount = "/mnt/filesystem1"
    pool  = "pool1"
  }
]
