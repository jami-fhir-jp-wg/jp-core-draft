Extension: JP_MedicationRequest_DosageInstruction_PeriodOfUse
Id: a6ce827d-1083-49c4-b538-201c18de518d
Title: "JP_MedicationRequest_DosageInstruction_PeriodOfUse"
Description: "投与開始日を格納する拡張"
* ^meta.lastUpdated = "2021-12-03T16:16:39.185+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse"
* ^version = "1.0.0"
* ^date = "2021-12-03T12:19:21.8091949Z"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "処方日とは別に明示的に投与・内服開始日を指定するため。"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* . ..1
* . ^short = "投与期間の開始日を明示するための拡張"
* . ^definition = "MedcationRequestの投与期間の開始日を明示するための拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse" (exactly)
* value[x] only Period
* value[x] ^short = "投与期間を表す"
* value[x] ^definition = "MedicationRequestに投与期間の開始日を明示するための拡張"
* value[x].start 1..
* value[x].start ^short = "投与期間の開始日"
* value[x].start ^definition = "明示された投与期間の開始日"