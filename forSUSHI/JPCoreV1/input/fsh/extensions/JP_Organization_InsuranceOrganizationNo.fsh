Extension: JP_Organization_InsuranceOrganizationNo
Id: 0951c1d5-7a75-488e-9e00-b2807dba71e5
Description: "保険医療機関番号７桁を表現するためのExtension。 JP Core Organizationプロファイルで利用されることを想定しているが、他のリソースでも利用可能である"
* ^meta.lastUpdated = "2021-12-01T06:35:51.467+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo"
* ^version = "1.0.0"
* ^date = "2021-11-30T06:46:39.7818895Z"
* ^context.type = #element
* ^context.expression = "Organization"
* . ^short = "保険医療機関番号７桁"
* . ^comment = "保険医療機関番号７桁。Identifier型の拡張\r\n「InsuranceOrganizationNo」を使用する。systemには医療機関コードを\r\n表すOID「1.2.392.100495.20.3.23」を指定する。\r\n\r\n電子処方箋 H7FHIR記述仕様書案の定義をベースにしているが、URLを以下に変更している \r\nhttp://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_InsuranceOrganizationNo" (exactly)
* value[x] only Identifier
* value[x].id ..0
* value[x].use ..0
* value[x].type ..0
* value[x].system = "urn:oid:1.2.392.100495.20.3.23" (exactly)
* value[x].system ^definition = "保険医療機関コードの名前空間を識別するURIを指定。固定値。"
* value[x].value ^definition = "保険医療機関番号７桁。半角数字で７桁固定。"
* value[x].period ..0
* value[x].assigner ..0