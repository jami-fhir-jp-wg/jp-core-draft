Extension: JP_Organization_PrefectureNo
Id: 147dd0ac-e43c-45c7-b994-7494b7cb0848
Description: """都道府県番号２桁を表現するためのExtension。
JP Core Organizationプロファイルで利用されることを想定しているが、他のリソースでも利用可能である"""
* ^meta.lastUpdated = "2021-12-01T06:35:42.702+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo"
* ^version = "1.0.0"
* ^date = "2021-11-30T06:32:24.0070401Z"
* ^context.type = #element
* ^context.expression = "Organization"
* . ^short = "都道府県番号2桁"
* . ^comment = "都道府県番号２桁。Identifier型の拡張を使用する。\r\nvalueには都道府県番号2桁の値を格納し、systemには都道府県番号を表すOID「1.2.392.100495.20.3.21」を指定する。"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Organization_PrefectureNo" (exactly)
* value[x] only Identifier
* value[x].id ..0
* value[x].use ..0
* value[x].type ..0
* value[x].system = "urn:oid:1.2.392.100495.20.3.21" (exactly)
* value[x].system ^definition = "都道府県番号の名前空間を識別するURIを指定"
* value[x].value ^definition = "2桁にゼロパディングされた都道府県番号。 例）北海道　 \"01\""
* value[x].period ..0
* value[x].assigner ..0