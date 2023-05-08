locals {
  common_tags = {
    Environment = var.environment
    Company     = var.company_name
    Project     = var.project_name
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

# Event Hub
resource "azurerm_eventhub_namespace" "eventhub_namespace" {
  name                = var.eventhub_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  capacity            = 1

  tags = local.common_tags
}

resource "azurerm_eventhub" "eventhub" {
  name                = var.eventhub_name
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  resource_group_name = var.resource_group_name
  partition_count     = 1
  message_retention   = 7
}

resource "azurerm_eventhub_authorization_rule" "send_rule" {
  name                = "send-rule"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  eventhub_name       = azurerm_eventhub.eventhub.name
  resource_group_name = var.resource_group_name

  listen = false
  send   = true
  manage = false
}

# Data Explorer
resource "azurerm_kusto_cluster" "data_explorer" {
  name                = var.data_explorer_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = "Dev(No SLA)_Standard_E2a_v4"
    capacity = 1
  }

  tags = local.common_tags
}

resource "azurerm_kusto_database" "data_explorer_db" {
  name                = var.data_explorer_database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = azurerm_kusto_cluster.data_explorer.name
  soft_delete_period  = "P7D"
  hot_cache_period    = "P1D"
}

# resource "azurerm_kusto_eventhub_data_connection" "data_explorer_eventhub_connection" {
#   name                = "${var.environment}-kustoeh-${var.company_name}"
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   cluster_name        = azurerm_kusto_cluster.data_explorer.name
#   database_name       = azurerm_kusto_database.data_explorer_db.name
#   eventhub_id         = azurerm_eventhub.eventhub.id
#   consumer_group      = "$Default"
#   table_name          = "EventHubRecords"
#   mapping_rule_name   = "EventHubRecordsMapping"
#   data_format         = "JSON"
#   event_system_properties_included = true
# }