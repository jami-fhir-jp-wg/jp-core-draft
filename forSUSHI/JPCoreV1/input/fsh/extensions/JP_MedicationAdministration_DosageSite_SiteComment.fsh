Extension: JP_MedicationAdministration_DosageSite_SiteComment
Id: cb26a2d4-7cfc-47c9-b3ef-0bc2cfb8aeb7
Title: "JP_MedicationAdministration_DosageSite_SiteComment"
Description: "投与部位コメントを格納するための拡張"
* ^meta.lastUpdated = "2021-12-04T09:31:39.314+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageSite_SiteComment"
* ^version = "1.0.0"
* ^date = "2021-12-03T00:00:00+09:00"
* ^publisher = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "投与部位コメントを格納するための拡張"
* ^copyright = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage.site"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageSite_SiteComment" (exactly)
* value[x] only string or CodeableConcept