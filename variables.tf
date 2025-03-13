variable "project_name" {
  type        = string
  description = "Name of the project"
  default     = "flatr0ckproject"
}

variable "environment" {
  type        = string
  description = "Env name"
  default     = "test"
}

variable "location" {
  type        = string
  default     = "swedencentral"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default = {
    Environment = "test"
    Project     = "flatr0ckproject"
    ManagedBy   = "terraform"
  }
}

variable "vnet_cidr" {
  type        = string
  description = "CIDR block for the virtual network"
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  type        = map(string)
  description = "CIDR blocks for subnets"
  default = {
    public = "10.0.1.0/24"
    web    = "10.0.2.0/24"
    db     = "10.0.3.0/24"
  }
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machines"
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the virtual machines"
  default     = "adminuser"
}

variable "admin_password" {
  type        = string
  description = "Admin password for the virtual machines"
  sensitive   = true
}

variable "instance_count" {
  type        = number
  description = "Number of instances in the scale set"
  default     = 2
}

variable "db_version" {
  type        = string
  description = "Version of PostgreSQL"
  default     = "11"
}

variable "db_sku_name" {
  type        = string
  description = "SKU name for the PostgreSQL server"
  default     = "GP_Gen5_2"
}

variable "db_admin_username" {
  type        = string
  description = "Admin username for the database"
  default     = "psqladmin"
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

variable "email_name" {
  type        = string
  description = "Email name"
  sensitive = true
}

variable "email_address" {
  type        = string
  description = "Email pass"
  sensitive = true
}