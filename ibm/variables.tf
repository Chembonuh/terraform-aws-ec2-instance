variable "region" {
  description = "Region where the instance will be deployed"
  type        = string
}

variable "zone" {
  description = "Zone where the instance will be deployed"
  type        = string
}

variable "ibmcloud_api_key" {
  description = "IBM Cloud API key"
  type        = string
}

variable "pi_workspace_guid" {
  description = "Workspace GUID for the PowerVS instance"
  type        = string
}

variable "pi_ssh_public_key_name" {
  description = "SSH public key name for the instance"
  type        = string
}

variable "pi_image_id" {
  description = "Boot image ID for the instance"
  type        = string
}

variable "pi_networks" {
  description = "List of private subnets to attach to the instance. The first element becomes the primary interface."
  type = list(
    object({
      name = string
      id   = string
      cidr = optional(string)
    })
  )
}

variable "pi_instance_name" {
  description = "Name of the LPAR instance"
  type        = string
}

variable "pi_sap_profile_id" {
  description = "SAP profile ID for the instance"
  type        = string
  default     = null
}

variable "pi_server_type" {
  description = "Server type for the instance"
  type        = string
  default     = null
}

variable "pi_number_of_processors" {
  description = "Number of processors for the instance"
  type        = number
  default     = null
}

variable "pi_memory_size" {
  description = "Memory size in GB for the instance"
  type        = number
  default     = null
}

variable "pi_cpu_proc_type" {
  description = "Processor type for the CPU (e.g., shared, dedicated, capped)"
  type        = string
  default     = null
}

variable "pi_boot_image_storage_pool" {
  description = "Boot image storage pool for the instance"
  type        = string
  default     = null
}

variable "pi_boot_image_storage_tier" {
  description = "Boot image storage tier for the instance"
  type        = string
  default     = null
}

variable "pi_replicants" {
  description = "Replication configuration for provisioning multiple instances"
  type = object({
    count  = number
    policy = string
  })
  default = {
    count  = 1
    policy = "none"
  }
}

variable "pi_placement_group_id" {
  description = "Placement group ID for the instance"
  type        = string
  default     = null
}

variable "pi_storage_config" {
  description = "File systems to be created and attached to the instance"
  type = list(
    object({
      name  = string
      size  = string
      count = string
      tier  = string
      mount = string
      pool  = optional(string)
    })
  )
  default = []
}
