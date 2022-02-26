Extension: JP_Organization_InsuranceOrganizationCategory
Id: 01530641-bc1b-4c76-a182-40fae3251e98
Description: "点数表コード１桁（医科１、歯科３）表現するためのExtension。 JP Core Organizationプロファイルで利用されることを想定しているが、他のリソースでも利用可能である"
* ^meta.lastUpdated = "2021-12-02T03:45:35.138+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationCategory"
* ^version = "1.0.0"
* ^date = "2021-12-01T06:35:56.7665609+00:00"
* ^context.type = #element
* ^context.expression = "Organization"
* . ^short = "点数表コード１桁（医科1、歯科３）"
* . ^comment = "点数表コード１桁（医科1、歯科３）。Identifier型の拡張\r\n「InsuranceOrganizationCategory」を使用する。systemには点数表番号\r\nを表すOID「1.2.392.100495.20.3.22」を指定する。"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationCategory" (exactly)
* value[x] only Identifier
* value[x].id ..0
* value[x].use ..0
* value[x].type ..0
* value[x].system = "urn:oid:1.2.392.100495.20.3.22" (exactly)
* value[x].system ^definition = "点数表番号の名前空間を識別するURIを指定。固定値。"
* value[x].value ^definition = "点数表コード１桁「1：医科」、「3：歯科」。"
* value[x].period ..0
* value[x].assigner ..0