resource "azurerm_resource_group" "my_rg" {
  name     = "my-rg"
  location = "westeurope"
}

module "my_web_app" {
  source = "./modules/web_app" # jeśli chcesz nazwać moduł inaczej - droga wolna :)

  resource_group_name = azurerm_resource_group.my_rg.name
  location            = azurerm_resource_group.my_rg.location

  web_app_name     = "my-app"
  service_plan_sku = "B1"

  sql_server_admin_login    = "sql-server-adm"
  sql_server_admin_password = "4-v3ry-53cr37-p455w0rd"
}

## TODO: jak powyższe zadziała - zrobić destroy, a potem 2 kolejne web apki, ale przy użyciu for_each na module