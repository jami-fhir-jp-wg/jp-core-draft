Extension: JP_MedicationDispense_Preparation
Id: 41bcb8d5-3940-4baf-8b00-9b8fbaa8ae5d
Title: "JP_MedicationDispense_Preparation"
Description: "薬剤単位の調剤結果"
* ^meta.lastUpdated = "2021-12-03T16:26:48.533+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation"
* ^version = "1.0.0"
* ^date = "2021-12-03T16:26:12.6876987+00:00"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "薬剤単位の調剤結果"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^context.type = #element
* ^context.expression = "MedicationDispense"
* . ^short = "調剤についてのExtension"
* . ^definition = "一包化、粉砕などの処理を行った際に記載する。"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation" (exactly)
* value[x] only string or CodeableConcept
* value[x] ^short = "調剤結果"
* value[x] ^definition = "薬剤単位の調剤結果"