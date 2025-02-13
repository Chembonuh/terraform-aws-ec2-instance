# Specify the IBM Cloud provider
provider "ibm" {
  ibmcloud_api_key = "W2WCo3b1aGHF-V8yjP_LEX4dw_1Sx3D1w6t4Yit35eiN" # Replace with your IBM Cloud API Key
  region           = "us-east"                                      # Replace with your desired region
}

# Define the SSH Key (replace with your public key)
resource "ibm_is_ssh_key" "my_ssh_key" {
  name       = "my-linux-instance-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCikl9ulbIeAsd718VvwqY973gP7hx6PInznxIuOl5ULJmS7PQ3c0lybSGH0YQDb9rTSFd1ofpdFBY9RVtnRVW3ocAlmUjyyrMJzOc28WDF/rC6duRffvep9wi305B5xYHJ1yySjONlJQBKuZRDWt/yHZDXGII/CevvAh1aTdT4UVQrsR2khBoiFMiaA5YgA+a/T0FVQChuixBToxuk5QKrfq9w/e3yvWfHMxbHaxTAwL3CnMxAl/7/GSVg1h3L5mC9rG4xqZjA15ocsSZt482XEvLYHDJlxMN9EFrDriINpMxuXEg3FJmjv52DVyQKbdf5YLKLgQ65m4hFIzTOe7nf ansible@hub.example.com"
}

# Create a Linux Virtual Server Instance with Ansible User
resource "ibm_is_instance" "my_linux_instance" {
  name    = "my-linux-instance"
  profile = "bx2-2x8" # Adjust based on your needs
  zone    = "us-east-1"
  image   = "r014-da69503f-30d4-4f1d-b03f-1f4a7cd29214" # Verify the image ID
  vpc     = ibm_is_vpc.my_vpc.id
  primary_network_interface {
    subnet = ibm_is_subnet.my_subnet.id
  }
  keys           = [ibm_is_ssh_key.my_ssh_key.id]
  resource_group = "6d54da55fe234b40a6df3ee6a0666679"

  # Cloud-init script to add an Ansible user
  user_data = <<EOF
#cloud-config
users:
  - name: ansible
    groups: sudo
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    ssh_authorized_keys:
      - "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCikl9ulbIeAsd718VvwqY973gP7hx6PInznxIuOl5ULJmS7PQ3c0lybSGH0YQDb9rTSFd1ofpdFBY9RVtnRVW3ocAlmUjyyrMJzOc28WDF/rC6duRffvep9wi305B5xYHJ1yySjONlJQBKuZRDWt/yHZDXGII/CevvAh1aTdT4UVQrsR2khBoiFMiaA5YgA+a/T0FVQChuixBToxuk5QKrfq9w/e3yvWfHMxbHaxTAwL3CnMxAl/7/GSVg1h3L5mC9rG4xqZjA15ocsSZt482XEvLYHDJlxMN9EFrDriINpMxuXEg3FJmjv52DVyQKbdf5YLKLgQ65m4hFIzTOe7nf ansible@hub.example.com"
EOF
}

# Output instance details
output "instance_details" {
  value = {
    instance_id   = ibm_is_instance.my_linux_instance.id
    instance_name = ibm_is_instance.my_linux_instance.name
    instance_zone = ibm_is_instance.my_linux_instance.zone
    public_ip     = ibm_is_instance.my_linux_instance.primary_network_interface[0].primary_ip[0].address
  }
}

