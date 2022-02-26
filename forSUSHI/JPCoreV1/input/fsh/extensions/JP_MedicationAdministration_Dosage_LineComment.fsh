Extension: JP_MedicationAdministration_Dosage_LineComment
Id: 7a1b4824-7464-47b1-ba4d-dad4dd006663
Title: "JP_MedicationAdministration_atDosage_LineComment"
Description: "ラインコメントを格納する"
* ^meta.lastUpdated = "2021-12-04T09:29:44.656+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_LineComment"
* ^version = "1.0.0"
* ^date = "2021-12-03T00:00:00+09:00"
* ^purpose = "ラインコメントを格納する"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_LineComment" (exactly)
* value[x] only string or CodeableConcept