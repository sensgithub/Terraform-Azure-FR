variable "resource_group_name" {
  type        = string
  description = "Rg name"
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
  description = "ID of the web subnet"
}

variable "db_subnet_id" {
  type        = string
  description = "ID - database subnet"
}

variable "tags" {
  type        = map(string)
  description = "Tags : resources"
}