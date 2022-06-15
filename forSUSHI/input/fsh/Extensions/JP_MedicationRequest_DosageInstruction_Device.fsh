Extension: JP_MedicationRequest_DosageInstruction_Device
Title: "JP_MedicationRequest_DosageInstruction_Device"
Description: "投与装置を格納する拡張"
* ^meta.lastUpdated = "2021-12-03T16:24:50.287+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Device"
* ^version = "1.0.0"
* ^date = "2021-12-03T14:07:29.3849157+00:00"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "投与装置を格納する拡張"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* . ^short = "投与装置"
* . ^definition = "投与装置を格納する拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Device" (exactly)
* value[x] only Reference