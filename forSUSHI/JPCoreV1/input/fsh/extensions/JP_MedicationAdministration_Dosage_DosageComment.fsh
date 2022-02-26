Extension: JP_MedicationAdministration_Dosage_DosageComment
Id: b8b80771-bdbb-4ce3-b7d5-9b56f90ff304
Title: "JP_MedicationAdministration_Dosage_DosageComment"
Description: "用法コメントを格納するための拡張"
* ^meta.lastUpdated = "2021-12-04T09:29:22.094+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_DosageComment"
* ^version = "1.0.0"
* ^date = "2021-11-03T17:52:25.0090408+00:00"
* ^purpose = "用法コメントを格納するための拡張"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_DosageComment" (exactly)
* value[x] only string or CodeableConcept