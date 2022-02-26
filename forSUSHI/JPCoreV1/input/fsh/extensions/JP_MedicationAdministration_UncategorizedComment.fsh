Extension: JP_MedicationAdministration_UncategorizedComment
Id: JP_MedicationAdministration_UncategorizedComment
Title: "JP_MedicationAdministration_UncategorizedComment"
Description: "未分類コメントを格納するための拡張"
* ^meta.lastUpdated = "2021-12-03T17:36:52.360+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_UncategorizedComment"
* ^version = "1.0.0"
* ^date = "2021-12-03"
* ^publisher = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "未分類コメントを格納するための拡張"
* ^copyright = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* . ^short = "未分類コメント"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_UncategorizedComment" (exactly)
* value[x] only string or CodeableConcept