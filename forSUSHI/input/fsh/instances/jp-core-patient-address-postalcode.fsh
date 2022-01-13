Instance: jp-core-patient-address-postalcode
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-core-patient-address-postalcode"
* version = "1.0.0"
* name = "JPCorePatientAddressPostalcode"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "Patientリソースのaddress-postal(郵便番号)に関する検索を定義します。"
* code = #address-postalcode
* base = #Patient
* type = #string
* expression = "Patient.address.postalCode"
* xpath = "f:Patient/f:address/f:postalCode"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* multipleOr.extension.valueCode = #"MAY"
* multipleAnd = true
* multipleAnd.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* multipleAnd.extension.valueCode = #"MAY"
* modifier[0] = #missing
* modifier[+] = #exact
* modifier[+] = #contains
* modifier[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"