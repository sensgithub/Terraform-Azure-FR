variable "resource_group_name" {
  type        = string
  description = "RG name"
}

variable "location" {
  type        = string
}

variable "project_name" {
  type        = string
}

variable "environment" {
  type        = string
  description = "Env name"
}

variable "web_subnet_id" {
  type        = string
  description = "ID - web subnet"
}

variable "web_nsg_id" {
  type        = string
  description = "ID - web network security group"
}

variable "backend_address_pool_id" {
  type        = string
  description = "ID - load balancer backend address pool"
}

variable "health_probe_id" {
  type        = string
  description = "ID - health probe"
  default     = null
}

variable "vm_size" {
  type        = string
  description = "Size - virtual machines"
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the vms"
  sensitive = true
}

variable "admin_password" {
  type        = string
  description = "Admin password for vms"
  sensitive   = true
}

variable "instance_count" {
  type        = number
  description = "Scale set instances"
  default     = 2
}

variable "tags" {
  type        = map(string)
  description = "Tags : resources"
}