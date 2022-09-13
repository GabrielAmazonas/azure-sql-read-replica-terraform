resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_mssql_server" "example" {
  name                         = "example"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
  
}

resource "azurerm_mssql_database" "example_db" {
  name      = "example-mssql-db"
  server_id = azurerm_mssql_server.example.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
  sku_name       = "S0"
  zone_redundant = true

  tags = {
    foo = "bar"
  }
  read_replica_count = 1
  read_scale = true
}

data "azurerm_mssql_database" "example_db" {
    server_id = azurerm_mssql_server.example.id
    name      = "example-mssql-db"
}

output "database_id" {
  value = data.azurerm_mssql_database.example_db.id
}

output "read_replica_count" {
  value = data.azurerm_mssql_database.example_db.read_replica_count
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.22.0"
    }
  }
}

provider "azurerm" {
  features {}
}