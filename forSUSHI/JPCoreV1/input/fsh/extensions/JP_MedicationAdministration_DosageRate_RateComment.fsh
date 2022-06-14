Extension: JP_MedicationAdministration_DosageRate_RateComment
Id: 5f45be03-73b5-425d-94fb-ff7dac12b87c
Title: "JP_MedicationAdministration_DosageRate_RateComment"
Description: "投与速度コメントを格納するための拡張"
* ^meta.lastUpdated = "2021-12-04T09:30:41.643+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageRate_RateComment"
* ^version = "1.0.0"
* ^date = "2021-12-03T00:00:00+09:00"
* ^publisher = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "投与速度コメントを格納するための拡張"
* ^copyright = "FHIR® Japanese implementation research workaing group in Japan Association of Medical Informatics (JAMI)"
* ^context.type = #element
* ^context.expression = "MedicationAdministration.dosage.rate[x]"
* . ^short = "投与速度コメント"
* . ^definition = "投与速度コメントを格納するための拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_DosageRate_RateComment" (exactly)
* value[x] only string or CodeableConcept