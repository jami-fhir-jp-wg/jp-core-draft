Extension: JP_Medication_IngredientStrength_StrengthType
Id: 88c8b7c4-fbfa-4a42-814d-071dc8acb4eb
Title: "JP_Medication_IngredientStrength_StrengthType"
Description: "投与量が製剤単位か成分単位かを格納する拡張"
* ^meta.lastUpdated = "2021-12-04T09:25:08.404+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType"
* ^version = "1.0.0"
* ^date = "2021-12-03T16:15:47.6343111+00:00"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "投与量が製剤単位か成分単位かを格納する拡張"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^context.type = #element
* ^context.expression = "Medication.ingredient.strength"
* . ^short = "力価区分"
* . ^definition = "投与量が製剤単位か成分単位かを格納する"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Medication_IngredientStrength_StrengthType" (exactly)
* value[x] only CodeableConcept