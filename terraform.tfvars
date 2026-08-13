rgs = {

  rg1 = {
    name     = "dev_rg"
    location = "centralindia"
  }
}

stgs = {

  stg1 = {

    name                     = "storagedevinder"
    location                 = "centralindia"
    resource_group_name      = "dev_rg"
    account_tier             = "Standard"
    account_replication_type = "LRS"

  }
}
