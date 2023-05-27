data "azurerm_api_management_api" "example" {
  name                = "naman"
  api_management_name = "example-apim"
  resource_group_name = "example-resource-group"
  revision            = "2"
}

resource "azurerm_api_management_api_policy" "example" {
  api_name            = "naman"
  api_management_name = "example-apim"
  resource_group_name = "example-resource-group"

  xml_content = <<XML
<policies>
  <inbound>
    <validate-content unspecified-content-type-action="prevent" max-size="102400" size-exceeded-action="prevent" errors-variable-name="requestBodyValidation">
            <content-type-map missing-content-type-value="application/json" />
            <content type="application/json" validate-as="json" action="detect" schema-id="Id" allow-additional-properties="false" />
        </validate-content>
  </inbound>
</policies>
XML
}