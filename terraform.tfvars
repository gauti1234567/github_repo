rgs = {

  rg1 = {
    name     = "dev_13"
    location = "centralindia"
  }
}

stgs = {

  stg1 = {

    name                     = "storagedevinder"
    location                 = "centralindia"
    resource_group_name      = "dev_13"
    account_tier             = "Standard"
    account_replication_type = "LRS"

  }
}
