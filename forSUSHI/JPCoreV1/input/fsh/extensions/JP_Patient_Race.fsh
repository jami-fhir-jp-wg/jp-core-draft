Extension: JP_Patient_Race
Id: b14aa99c-ab14-403f-8efd-4a9de985514d
Description: "人種(Race)に関する情報を格納するためのExtension。"
* ^meta.lastUpdated = "2021-11-30T10:09:36.662+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race"
* ^version = "1.0.0"
* ^date = "2021-11-30T09:57:31.0583757+00:00"
* ^context.type = #element
* ^context.expression = "Patient"
* . ^short = "人種に関する情報"
* . ^comment = "人種に関する情報を表現する拡張。\r\nValueSetとして\r\nhttp://terminology.hl7.org/CodeSystem/v3-Race\r\nを使用する。\r\n例：\r\nCode : Description\r\n2103-3 : White\r\n2039-6 : Japanese\r\n2040-4 : Korean\r\n等"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Patient_Race" (exactly)
* value[x] only Coding
* value[x].system = "urn:oid:2.16.840.1.113883.5.104" (exactly)