Extension: JP_MedicationRequest_DosageInstruction_UsageDuration
Id: d2a74cc1-3928-4f1d-afe8-e7b49a2b4b04
Title: "JP_MedicationRequest_DosageInstruction_UsageDuration"
Description: "隔⽇投与など、服⽤開始⽇から終了⽇までの⽇数と実投与⽇数が異なる場合に、実投与⽇数を明⽰したい場合に使⽤する拡張"
* ^meta.lastUpdated = "2021-12-03T16:20:07.109+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration"
* ^version = "1.0.0"
* ^date = "2021-12-03T12:07:57.3669816Z"
* ^publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^purpose = "隔⽇投与など、服⽤開始⽇から終了⽇までの⽇数と実投与⽇数が異なる場合に、実投与⽇数を明⽰したい場合に使⽤する拡張"
* ^copyright = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* id ..0
* id ^short = "エレメント間参照のためのID"
* id ^definition = "JP Coreでは使用されない。"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration" (exactly)
* value[x] only Duration
* value[x] ^short = "実投与⽇数"
* value[x] ^definition = "隔日投与などで実投与日数と処方期間が異なる場合に用いられる。"
* value[x].id ..0
* value[x].id ^short = "エレメント間参照のためのID"
* value[x].id ^definition = "JP Coreでは使用されない。"
* value[x].value 1..
* value[x].value ^short = "実投与日数"
* value[x].value ^definition = "隔日投与などで実投与日数と処方期間が異なる場合に用いられる。"
* value[x].comparator ..0
* value[x].unit 1..
* value[x].code = #d (exactly)
* value[x].system = "http://unitsofmeasure.org" (exactly)
* value[x].unit = "日" (exactly)
* value[x].unit ^short = "実投与日数単位"
* value[x].unit ^definition = "「日」で固定される"
* value[x].system 1..
* value[x].system ^short = "UCUM"
* value[x].system ^definition = "単位コード UCUMを識別するURI。固定値。"
* value[x].code 1..
* value[x].code ^short = "単位コードUCUMにおける実投与⽇数の単位"
* value[x].code ^definition = "単位コードUCUMにおける実投与⽇数の単位。dで固定される"