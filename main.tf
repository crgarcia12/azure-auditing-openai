locals {
  openai_instances = [
    {
      name             = "dev-openai-instance-1"
      region           = "South Central US"
      active_models = [
        {
          name    = "gpt-35-turbo"
          version = "0301"
        },
      ]
      ad_group         = "AD-Group-1"
    },
  ]
}

module "apim_vnet_cognitive_services" {
  source = "./modules/apim_vnet_cognitive_services"

  location                    = "South Central US"
  environment                 = "dev"
  company_name                = "contoso"
  project_name                = "openai"
  vnet_address_space          = ["10.0.0.0/16"]
  apim_subnet_prefix          = "10.0.1.0/24"
  cognitive_services_subnet_prefix = "10.0.2.0/24"
  apim_name                   = "dev-api-contoso"
  publisher_name              = "Contoso Publisher"
  publisher_email             = "publisher@contoso.com"
  openai_instances            = local.openai_instances
  resource_group_name         = "rg-dev-contoso-openai"
  api_management_sku          = "Developer_1"
  allowed_openai_backends     = ["cogsvc-dev-openai-instance1"]
  
  eventhub_namespace_name     = "dev-ehns-contoso"
  eventhub_name               = "dev-eh-contoso"
  eventhub_rg                 = "rg-dev-contoso-openai-data"

  depends_on                 = [module.eventhub_dataexplorer]
}

module "eventhub_dataexplorer" {
  source = "./modules/eventhub_dataexplorer"

  location                    = "South Central US"
  environment                 = "dev"
  company_name                = "contoso"
  project_name                = "openai"
  eventhub_namespace_name     = "dev-ehns-contoso"
  eventhub_name               = "dev-eh-contoso"
  data_explorer_cluster_name  = "devdxcontoso"
  data_explorer_database_name = "dev-dx-db-contoso"
  resource_group_name         = "rg-dev-contoso-openai-data"
}