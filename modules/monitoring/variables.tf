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

variable "vmss_id" {
  type        = string
  description = "ID - virtual machine scale set"
}

variable "lb_id" {
  type        = string
  description = "ID - load balancer"
}

variable "db_id" {
  type        = string
  description = "ID - database server"
}

variable "email_name" {
  type        = string
  description = "Email name"
  sensitive = true
}

variable "email_address" {
  type        = string
  description = "Email address"
  sensitive = true
}

variable "tags" {
  type        = map(string)
  description = "Tags : resources"
}