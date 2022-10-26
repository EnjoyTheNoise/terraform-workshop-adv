resource "azurerm_service_plan" "plan" {
}

resource "azurerm_windows_web_app" "web_app" {
  site_config {}

  connection_string { # ten blok nie zadziała, również należy go uzupełnić, zostawiłem value, żeby nie tracić na to czasu
    value = "Server=tcp:${azurerm_mssql_server.sql_server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.sql_db.name};Persist Security Info=False;User ID=${azurerm_mssql_server.sql_server.administrator_login};Password=${azurerm_mssql_server.sql_server.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
}

resource "azurerm_mssql_server" "sql_server" {
}

resource "azurerm_mssql_database" "sql_db" {
}
