variable "name" {
  type        = string
  description = "Specifies the name of the Databricks Workspace resource."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which the Databricks Workspace should exist."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource has to be created."
}

variable "sku" {
  type        = string
  description = "The sku to use for the Databricks Workspace."
}

variable "managed_services_cmk_key_vault_key_id" {
  type    = string
  default = null
}

variable "managed_disk_cmk_key_vault_key_id" {
  type    = string
  default = null
}

variable "managed_disk_cmk_rotation_to_latest_version_enabled" {
  type    = bool
  default = null
}

variable "managed_resource_group_name" {
  type        = string
  description = "The name of the resource group where Azure should place the managed Databricks resources."
  default     = null
}

variable "customer_managed_key_enabled" {
  type    = bool
  default = false
}

variable "infrastructure_encryption_enabled" {
  type    = bool
  default = false
}

variable "public_network_access_enabled" {
  type        = string
  description = "Allow public access for accessing workspace."
  default     = false
}

variable "network_security_group_rules_required" {
  type    = string
  default = null
}

variable "custom_parameters" {
  type = object({
    nat_gateway_name                                     = optional(string)
    public_ip_name                                       = optional(string)
    no_public_ip                                         = optional(bool)
    public_subnet_name                                   = optional(string)
    public_subnet_network_security_group_association_id  = optional(string)
    private_subnet_name                                  = optional(string)
    private_subnet_network_security_group_association_id = optional(string)
    storage_account_name                                 = optional(string)
    storage_account_sku_name                             = optional(string)
    virtual_network_id                                   = optional(string)
    vnet_address_prefix                                  = optional(string)
  })
  description = ""
  default     = null
}

variable "tags" {
  type        = map(any)
  default     = null
}
