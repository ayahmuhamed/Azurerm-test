provider "azurerm" {
  subscription_id = var.ARM_SUBSCRIPTION
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID

  features {}
}

# Provider for connecting to subscription that contains shared image gallery
provider "azurerm" {
  alias           = "build-sub"
  subscription_id = var.ARM_SUBSCRIPTION_ALTER
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID

  features {}
}

resource "azurerm_resource_group" "test" {
    provider = azurerm
    name = "${var.prefix}-test"
    location = "westus2"
}

resource "azurerm_resource_group" "test2" {
    provider = azurerm.build-sub
    name = "${var.prefix}-test"
    location = "westus2"
}
