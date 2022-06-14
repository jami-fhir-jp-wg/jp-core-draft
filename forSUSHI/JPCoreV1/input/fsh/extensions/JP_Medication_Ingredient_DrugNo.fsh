Extension: JP_Medication_Ingredient_DrugNo
Id: 4b53c2de-7595-40da-9c04-bb912b394f27
Title: "JP_Medication_Ingredient_DrugNo"
Description: "投与量が製剤単位か成分単位かを格納する拡張"
* ^meta.lastUpdated = "2021-12-04T09:25:25.010+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo"
* ^version = "1.0.0"
* ^date = "2021-12-03T15:25:07.4303514Z"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "投与量が製剤単位か成分単位かを格納する拡張"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^context.type = #element
* ^context.expression = "Medication.ingredient"
* . ^short = "RP内の薬剤の連番"
* . ^definition = "RP内の薬剤の連番"
* id ^short = "RP内の薬剤の連番"
* id ^definition = "RP内の薬剤の連番"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_Ingredient_DrugNo" (exactly)
* value[x] only integer