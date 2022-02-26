Extension: JP_MedicationAdministration_DosageMethod_MethodComment
Id: 4327927e-6d72-442a-bd48-5d5b059bd8fe
Title: "JP_MedicationAdministration_DosageMethod_MethodComment"
Description: "手技コメントを格納するための拡張"
* ^meta.lastUpdated = "2021-12-04T09:30:22.110+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageMethod_MethodComment"
* ^version = "1.0.0"
* ^date = "2021-12-03T00:00:00+09:00"
* ^publisher = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "手技コメントを格納するための拡張"
* ^copyright = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage.method"
* . ^short = "手技コメント"
* . ^definition = "手技コメントを格納するための拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageMethod_MethodComment" (exactly)
* value[x] only string or CodeableConcept