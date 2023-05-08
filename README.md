Azure Auditing OpenAI🕵️
==================================

This Terraform repository provisions an environment to run and manage an OpenAI instance on Azure. The environment includes an Azure API Management (APIM) service, Cognitive Services, an Event Hub, and a Data Explorer. The APIM service is used to expose a unified API for OpenAI instances, while the Event Hub and Data Explorer are used for logging and analyzing usage data.

Repository Structure
--------------------

The repository is structured as follows:

-   `main.tf`: The main configuration file that includes the `locals`, `module "apim_vnet_cognitive_services"`, and `module "eventhub_dataexplorer"` blocks.
-   `modules/`: Contains the Terraform modules used in the project.
    -   `apim_vnet_cognitive_services/`: Module for creating API Management, Virtual Network, and Cognitive Services resources.
    -   `eventhub_dataexplorer/`: Module for creating Event Hub and Data Explorer resources.

Usage
-----

1.  Install [Terraform](https://www.terraform.io/downloads.html).
2.  Clone this repository and navigate to the repository folder.
3.  Initialize Terraform: `terraform init`.
5.  Apply the Terraform configuration: `terraform apply`.OpenAI Terraform Repository README
==================================

Repository Structure
--------------------

The repository is structured as follows:

-   `main.tf`: The main configuration file that includes the `locals`, `module "apim_vnet_cognitive_services"`, and `module "eventhub_dataexplorer"` blocks.
-   `modules/`: Contains the Terraform modules used in the project.
    -   `apim_vnet_cognitive_services/`: Module for creating API Management, Virtual Network, and Cognitive Services resources.
    -   `eventhub_dataexplorer/`: Module for creating Event Hub and Data Explorer resources.

Usage
-----

1.  Install [Terraform](https://www.terraform.io/downloads.html).
2.  Clone this repository and navigate to the repository folder.
3.  Initialize Terraform: `terraform init`.
5.  Apply the Terraform configuration: `terraform apply`.
