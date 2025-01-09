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
  description = "Existing list of private subnet ids to be attached to an instance. The first element will become the primary interface."
  type = list(
    object({
      name = string
      id   = string
      cidr = optional(string)
    })
  )
}


variable "pi_instance_name" {
  description = "List of instance names for the LPARs"
  type        = list(string)
}

# Optional Variables
variable "pi_sap_profile_id" {
  description = "The SAP profile ID for the instance (optional)"
  type        = string
  default     = null
}

variable "pi_server_type" {
  description = "The server type for the instance (optional)"
  type        = string
  default     = null
}

variable "pi_number_of_processors" {
  description = "The number of processors for the instance (optional)"
  type        = number
  default     = null
}

variable "pi_memory_size" {
  description = "The memory size in GB for the instance (optional)"
  type        = number
  default     = null
}

variable "pi_cpu_proc_type" {
  description = "The processor type for the CPU (e.g., shared, dedicated, or capped)"
  type        = string
  default     = null
}

variable "pi_boot_image_storage_pool" {
  description = "The boot image storage pool for the instance (optional)"
  type        = string
  default     = null
}

variable "pi_boot_image_storage_tier" {
  description = "The boot image storage tier for the instance (optional)"
  type        = string
  default     = null
}

variable "pi_replicants" {
  description = "The replicants for the instance (optional)"
  type = list(object({
    name = string
    value = string
  }))
  default = null
}

variable "pi_placement_group_id" {
  description = "The placement group ID for the instance (optional)"
  type        = string
  default     = null
}

variable "pi_existing_volume_ids" {
  description = "The existing volume IDs to attach to the instance (optional)"
  type        = list(string)
  default     = null
}

variable "pi_storage_config" {
  description = "File systems to be created and attached to PowerVS instance"
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


variable "pi_instance_init_linux" {
  description = "Linux initialization configuration for the instance (optional)"
  type        = map(any)
  default     = null
}

variable "pi_network_services_config" {
  description = "Network services configuration for the instance (optional)"
  type        = map(any)
  default     = null
}

variable "pi_user_tags" {
  description = "User-defined tags for the instance (optional)"
  type        = list(string)
  default     = [] # Default to an empty list if not used
}

