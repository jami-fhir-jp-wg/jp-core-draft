Instance: jp-core-medicationrequest-requester
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-core-medicationrequest-requester"
* version = "1.0.0"
* name = "JPCoreMedicationRequestrRequester"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "MedicationRequestリソースのrequesterに関する検索を定義します。"
* code = #requester
* base = #MedicationRequest
* type = #reference
* expression = "MedicationRequest.requester.where(resolve() is Patient)"
* xpath = "f:MedicationRequest/f:requester"
* xpathUsage = #normal
* target = #Practitioner
* multipleOr = true
* multipleOr.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* multipleOr.extension.valueCode = #"MAY"
* multipleAnd = true
* multipleAnd.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* multipleAnd.extension.valueCode = #"MAY"
* modifier[0] = #missing
* modifier[+] = #type
* modifier[+] = #identifier
* modifier[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* chain[0] = "identifier"
* chain[+] = "name"
* chain[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* chain[=].extension.valueCode = #"SHALL"
* chain[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* chain[=].extension.valueCode = #"SHALL"