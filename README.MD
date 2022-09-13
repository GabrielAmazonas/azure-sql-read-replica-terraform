## Installing pre-requisites:
`
    brew tap hashicorp/tap
`

`
    brew install hashicorp/tap/terraform
`   

Azure CLI version 2.0.79 or newer.

` 
brew update && brew install azure-cli
`

Run az login to setup account.


terraform CLI - Main commands:

  - init:          Prepare your working 
  directory for other commands

  - validate:      Check whether the configuration is valid

  - plan:          Show changes required by the current configuration

  - apply:         Create or update infrastructure

  - destroy:       Destroy previously-created infrastructure


## Important Configurations:

- resource "azurerm_mssql_database" :
    
    1. read_replica_count:

        The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed.

    2. read_scale:

        If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica.

