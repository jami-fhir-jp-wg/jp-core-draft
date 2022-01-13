Instance: GOFSH-GENERATED-ID-0
InstanceOf: MedicationAdministration
Usage: #example
* contained[0] = Inline-Instance-for-GOFSH-GENERATED-ID-0-1
* contained[+] = Inline-Instance-for-GOFSH-GENERATED-ID-0-2
* extension[0].url = "http://hl7fhir.jp/fhir/StructureDefinition/JP_MedicationAdminstrationRequestDepartment"
* extension[=].valueCodeableConcept = $v2-0069#01 "内科"
* extension[+].url = "http://hl7fhir.jp/fhir/StructureDefinition/JP_MedicationAdministrationRequester"
* extension[=].valueReference = Reference(Practitioner/2) "医師 一郎"
* extension[+].url = "http://hl7fhir.jp/fhir/StructureDefinition/JP_MedicationAdministrationRequestAuthoredOn"
* extension[=].valueDateTime = "2016-07-01T00:00:00+09:00"
* extension[+].url = "http://hl7fhir.jp/fhir/StructureDefinition/JP_MedicationAdminstrationLocation"
* extension[=].valueReference = Reference(Location/1) "09A病棟 021病室 4ベッド"
* identifier[0].system = "http://www.example.com/fhir/order-number"
* identifier[=].value = "123456789012345"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.81"
* identifier[=].value = "1"
* identifier[+].system = "urn:oid:1.2.392.100495.20.3.82"
* identifier[=].value = "1"
* status = #completed
* category = $v2-0482#I "入院オーダ"
* medicationReference = Reference(Medication/1)
* subject = Reference(Patient/1)
* effectivePeriod.start = "2016-07-01T08:05:21+09:00"
* effectivePeriod.end = "2016-07-01T13:05:43+09:00"
* performer.function = $med-admin-perform-function#performer "Performer"
* performer.actor = Reference(Practitioner/1) "看護 花子"
* request = Reference(MedicationRequest/1)
* dosage.extension.url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministrationLine"
* dosage.extension.valueCodeableConcept = $99ILL#01 "主管"
* dosage.site.extension.url = "http://hl7.org/fhir/StructureDefinition/bodySite"
* dosage.site.extension.valueReference = Reference(BodyStructure/1) "左腕"
* dosage.route = $v2-0162#IV "静脈内"
* dosage.method = $99ILL_1#102 "点滴静注(末梢)"
* dosage.dose = 510 'mL' "mL"
* dosage.rateRatio.numerator = 102 'mL' "mL"
* dosage.rateRatio.denominator = 1 'h' "h"