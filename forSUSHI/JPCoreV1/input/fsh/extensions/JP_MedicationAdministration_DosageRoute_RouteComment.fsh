Extension: JP_MedicationAdministration_DosageRoute_RouteComment
Id: 7d2bd9f9-3e77-423c-be7f-8602a284fe0a
Title: "JP_MedicationAdministration_DosageRoute_RouteComment"
Description: "投与経路コメントを格納するための拡張"
* ^meta.lastUpdated = "2021-12-04T09:31:10.517+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageRoute_RouteComment"
* ^version = "1.0.0"
* ^date = "2021-11-03T17:19:40.8495967+00:00"
* ^publisher = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "投与経路コメントを格納するための拡張"
* ^copyright = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage.route"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageRoute_RouteComment" (exactly)
* value[x] only string or CodeableConcept