terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}

provider "azurerm" {
    subscription_id = "01eeeaab-c04c-4234-ac92-9da73ad728d4"
    features {
    }
  # Configuration options
}