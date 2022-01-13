Instance: jp-core-encounter-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-core-encounter-identifier"
* version = "1.0.0"
* name = "JPCoreEncounterIdentifier"
* status = #active
* experimental = false
* date = "2019-09-23T19:48:45+10:00"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/usrealm/index.cfm"
* description = "Encounterリソースのidentifierに関する検索を定義します。"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* code = #identifier
* base = #Encounter
* type = #token
* expression = "Encounter.identifier"
* xpath = "f:Encounter/f:identifier"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* multipleOr.extension.valueCode = #"MAY"
* multipleAnd = true
* multipleAnd.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* multipleAnd.extension.valueCode = #"MAY"
* modifier[0] = #missing
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #below
* modifier[+] = #above
* modifier[+] = #ofType
* modifier[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"
* modifier[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* modifier[=].extension.valueCode = #"MAY"