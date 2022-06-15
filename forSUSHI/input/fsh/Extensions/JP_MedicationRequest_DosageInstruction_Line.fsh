Extension: JP_MedicationRequest_DosageInstruction_Line
Title: "JP_MedicationRequest_DosageInstruction_Line"
Description: "指示ラインを格納するための拡張"
* ^meta.lastUpdated = "2021-12-03T16:23:26.879+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line"
* ^version = "1.0.0"
* ^date = "2021-12-03T14:07:12.5634947+00:00"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "指示ラインを格納するための拡張"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage"
* . ^short = "指示ライン"
* . ^definition = "指示ラインを格納する拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line" (exactly)
* value[x] only CodeableConcept