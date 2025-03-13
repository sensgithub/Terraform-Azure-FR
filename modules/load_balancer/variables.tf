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

variable "public_subnet_id" {
  type        = string
  description = "ID of the public subnet"
}

variable "web_nsg_id" {
  type        = string
  description = "ID of the web network security group"
}

variable "tags" {
  type        = map(string)
  description = "Tags : resources"
}