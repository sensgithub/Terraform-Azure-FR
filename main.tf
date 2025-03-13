terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "flatr0ck-tf-res-g"
    storage_account_name = "tfstateflatr0ck"
    container_name       = "tfstate"
    key                  = "app.tfstate"
  }

}

data "azurerm_resource_group" "rg" {
  name = "flatr0ck-tf-res-g"
}

module "network" {
  source = "./modules/network"
  
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  project_name        = var.project_name
  environment         = var.environment
  vnet_cidr           = var.vnet_cidr
  subnet_cidrs        = var.subnet_cidrs
  tags                = var.tags
}

module "security" {
  source = "./modules/security"
  
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  project_name        = var.project_name
  environment         = var.environment
  web_subnet_id       = module.network.web_subnet_id
  db_subnet_id        = module.network.db_subnet_id
  tags                = var.tags
}

module "load_balancer" {
  source = "./modules/load_balancer"
  
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  project_name        = var.project_name
  environment         = var.environment
  public_subnet_id    = module.network.public_subnet_id
  web_nsg_id          = module.security.web_nsg_id
  tags                = var.tags
}

module "vmss" {
  source = "./modules/vmss"
  
  resource_group_name   = data.azurerm_resource_group.rg.name
  location              = data.azurerm_resource_group.rg.location
  project_name          = var.project_name
  environment           = var.environment
  web_subnet_id         = module.network.web_subnet_id
  web_nsg_id            = module.security.web_nsg_id 
  backend_address_pool_id = module.load_balancer.backend_address_pool_id
  vm_size               = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  instance_count        = var.instance_count
  tags                  = var.tags
}

module "database" {
  source = "./modules/database"
  
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  project_name        = var.project_name
  environment         = var.environment
  subnet_id           = module.network.db_subnet_id
  db_nsg_id           = module.security.db_nsg_id
  db_version          = var.db_version
  db_sku_name         = var.db_sku_name
  db_admin_username   = var.db_admin_username
  db_admin_password   = var.db_admin_password
  db_storage_mb       = var.db_storage_mb
  tags                = var.tags
}

module "monitoring" {
  source = "./modules/monitoring"
  
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  project_name        = var.project_name
  environment         = var.environment
  vmss_id             = module.vmss.vmss_id
  lb_id               = module.load_balancer.lb_id
  db_id               = module.database.db_id
  email_name          = var.email_name
  email_address       = var.email_address
  tags                = var.tags
}