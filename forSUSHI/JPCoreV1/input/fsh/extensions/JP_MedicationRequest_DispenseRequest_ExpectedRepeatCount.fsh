Extension: JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount
Id: 996ef0bf-8b22-46e5-bc34-46c7bd6c6926
Title: "JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount"
Description: "頓用回数"
* ^meta.lastUpdated = "2021-12-03T12:47:27.169+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount"
* ^version = "1.0.0"
* ^date = "2021-12-03T12:42:41.6873441+00:00"
* ^purpose = "頓用の場合など調剤量を錠数ではなく回数で表現したい場合の回数を格納する拡張"
* ^context.type = #element
* ^context.expression = "MedicationRequest.dispenseRequest"
* . ..1
* . ^short = "頓⽤回数を表現する拡張"
* . ^definition = "頓⽤回数を表現する拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount" (exactly)
* value[x] 1..
* value[x] only integer
* value[x] ^short = "頓用回数"
* value[x] ^definition = "頓用回数"