Extension: JP_MedicationRequest_DispenseRequest_InstructionForDispense
Id: 91cc41f3-a701-4cbe-b9bc-7d810bb7e9e5
Title: "JP_MedicationRequest_DispenseRequest_InstructionForDispense"
Description: "調剤指示。薬剤単位の調剤指示を表現するための拡張"
* ^meta.lastUpdated = "2021-12-03T14:50:05.953+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense"
* ^version = "1.0.0"
* ^date = "2021-12-03T14:48:42.1477777+00:00"
* ^purpose = "薬剤単位の調剤指示を表現するための拡張"
* ^context.type = #element
* ^context.expression = "MedicationRequest.dispenseRequest"
* id ..0
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense" (exactly)
* value[x] only string or CodeableConcept