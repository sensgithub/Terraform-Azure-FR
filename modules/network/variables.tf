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

variable "vnet_cidr" {
  type        = string
  description = "CIDR block for the virtual network"
}

variable "subnet_cidrs" {
  type        = map(string)
  description = "CIDR blocks for subnets"
}

variable "tags" {
  type        = map(string)
  description = "Tags : resources"
}