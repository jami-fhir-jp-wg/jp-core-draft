Instance: 91c0caf5-6b57-4c80-b419-9196b23d41f8
InstanceOf: MedicationRequest
Usage: #example
* contained[0] = Inline-Instance-for-91c0caf5-6b57-4c80-b419-9196b23d41f8-1
* contained[+] = Inline-Instance-for-91c0caf5-6b57-4c80-b419-9196b23d41f8-2
* identifier[0].system = "urn:oid:1.2.392.100495.20.3.11"
* identifier[=].value = "123456789012345"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "123456789012345_01_001"
* status = #active
* intent = #order
* category[0] = $v2-0482#I "入院患者オーダ"
* category[+] = $MR9PCategory#IHP "入院処方"
* category[+] = $JHSI0001#FTP "定時処方"
* medicationReference = Reference(urn:uuid:91c0caf5-6b57-4c80-b419-9196b23d41f8)
* medicationReference.type = "Medication"
* subject = Reference(urn:uuid:79965040-5c95-4ce5-b8f7-efe606c364b4)
* subject.type = "Patient"
* authoredOn = "2016-07-01"
* requester = Reference(urn:uuid:b598aedf-28fb-406a-b38e-250d3e92ac60)
* requester.type = "PractitionerRole"
* insurance = Reference(urn:uuid:df0ebf6d-e527-49d4-bce2-0885045a7afd)
* insurance.type = "Coverage"
* dosageInstruction.extension.url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequestDevice"
* dosageInstruction.extension.valueCodeableConcept = $99ILL#01 "シリンジ"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2016-07-01T10:00:00+09:00"
* dosageInstruction.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosageInstruction.site.extension.valueReference = Reference(urn:uuid:0cdd1de5-d48f-4cf4-9238-2dba48fbbc39)
* dosageInstruction.site.extension.valueReference.type = "BodyStructure"
* dosageInstruction.route = urn:oid:1.2.392.100495.20.2.35#30 "静脈注射"
* dosageInstruction.method = urn:oid:1.2.392.100495.20.2.34#3 "注射"
* dosageInstruction.doseAndRate.doseQuantity.value = 2
* dosageInstruction.doseAndRate.doseQuantity.unit = "ミリリッター"