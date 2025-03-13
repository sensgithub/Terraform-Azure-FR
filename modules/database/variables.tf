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

variable "subnet_id" {
  type        = string
  description = "ID : database subnet"
}

variable "db_nsg_id" {
  type        = string
  description = "ID : database network security group"
}

variable "db_version" {
  type        = string
  default     = "16"
}

variable "db_sku_name" {
  type        = string
  description = "SKU name for the PostgreSQL server"
  default     = "GP_Gen5_2"
}

variable "db_admin_username" {
  type        = string
  description = "Admin username for the database"
  sensitive = true
}

variable "db_admin_password" {
  type        = string
  description = "Admin password for the database"
  sensitive   = true
}

variable "db_storage_mb" {
  type        = number
  description = "Storage size for the database in MB"
  default     = 5120
}

variable "tags" {
  type        = map(string)
  description = "Tags : resources"
}