Instance: a97c3c13-ac3c-412a-a9fb-2237a17138b8
InstanceOf: MedicationRequest
Usage: #example
* contained[0] = Inline-Instance-for-a97c3c13-ac3c-412a-a9fb-2237a17138b8-1
* contained[+] = Inline-Instance-for-a97c3c13-ac3c-412a-a9fb-2237a17138b8-2
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[=].value = "123456789012345"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "123456789012345_01_001"
* status = #active
* intent = #order
* category[0] = $v2-0482#I "入院患者オーダ"
* category[+] = $MR9PCategory#IHP "入院処方"
* category[+] = $JHSI0001#FTP "定時処方"
* medicationReference = Reference(urn:uuid:a97c3c13-ac3c-412a-a9fb-2237a17138b8)
* medicationReference.type = "Medication"
* subject = Reference(urn:uuid:7bc33f58-121a-4e59-bdd5-96cd7ce4f158)
* subject.type = "Patient"
* authoredOn = "2016-07-01"
* requester = Reference(urn:uuid:70c503af-b04b-4104-8c18-1bf97766927c)
* requester.type = "PractitionerRole"
* insurance = Reference(urn:uuid:02222cfc-81c0-4a45-a8bd-50b814f885ae)
* insurance.type = "Coverage"
* dosageInstruction.extension.url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequestLine"
* dosageInstruction.extension.valueCodeableConcept = $99ILL#01 "主管"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T08:00:00+09:00"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2016-07-01T13:00:00+09:00"
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosageInstruction.site.extension.valueReference = Reference(urn:uuid:2726417c-4d80-4bd3-8175-109d8e26379b)
* dosageInstruction.site.extension.valueReference.type = "BodyStructure"
* dosageInstruction.route = urn:oid:1.2.392.100495.20.2.35#30 "静脈注射"
* dosageInstruction.method = urn:oid:1.2.392.100495.20.2.34#3 "注射"
* dosageInstruction.doseAndRate[0].doseQuantity.value = 510
* dosageInstruction.doseAndRate[=].doseQuantity.unit = "ミリリッター"
* dosageInstruction.doseAndRate[+].rateRatio.numerator.value = 102
* dosageInstruction.doseAndRate[=].rateRatio.numerator.unit = "ml"
* dosageInstruction.doseAndRate[=].rateRatio.denominator.value = 1
* dosageInstruction.doseAndRate[=].rateRatio.denominator.unit = "h"