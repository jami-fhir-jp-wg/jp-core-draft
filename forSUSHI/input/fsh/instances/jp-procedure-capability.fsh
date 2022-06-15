Instance: jp-procedure-capability
InstanceOf: CapabilityStatement
Usage: #definition
* meta.versionId = "47"
* meta.lastUpdated = "2021-08-17T03:02:28.671+00:00"
* meta.source = "#KBL3EPJxogq1mZJG"
* url = "https://hl7fhir.jp/fhir/ImplementationGuide/CapabilityStatement/jp-procedure-capability"
* version = "0.0.1"
* name = "JPCoreProcedureCapability"
* title = "JP Core Procedure Capability"
* status = #draft
* experimental = false
* date = "2021-08-05"
* publisher = "HL7 FHIR JP WG・・・"
* description = "ここでは、問い合わせ方法について記載します。"
* jurisdiction = urn:iso:std:iso:3166#JP "Japan"
* jurisdiction.text = "Jurisdiction"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* rest.mode = #client
* rest.resource.type = #Procedure
* rest.resource.supportedProfile = "https://hl7fhir.jp/fhir/ImplementationGuide/StructureDefinition/JP-Procedure"
* rest.resource.documentation = "必須検索パラメータ\n次の検索パラメータは必須でサポートされなければならない。\n\n* identifier 検索パラメータを使用して、医療従事者番号などの識別子によるPractitionerの検索をサポートしなければならない（SHALL）。  \n　GET [base]/Practitioner?identifier={system|}[code]  \n　例：  \n　　　GET [base]/Practitioner?identifier=http://myhospital.com/fhir/drid|123456  \n　　　指定された識別子(identifier)に一致するPractitionerリソースを含むBundleを検索する。  \n \n* name 検索パラメータを使用して、任意の名前パートによる文字列検索をサポートしなければならない（SHALL）。  \n　GET [base]/Practitioner?name=[string]  \n　例：  \n　　　GET [base]/Practitioner?name=山田  \n　　　名前（姓:family、名:given、またはテキスト:text）が一致するPractitionerリソースを含むBundleを検索する。\n\n推奨検索パラメータ  \n* 推奨検索パラメータ(SHOULD)はありません。\n\nオプション検索パラメータ  \n* オプション検索パラメータ(MAY)はありません。\n\nOperation一覧  \n* Operationはありません。"
* rest.resource.interaction[0].code = #search-type
* rest.resource.interaction[+].code = #read
* rest.resource.interaction[+].code = #vread
* rest.resource.interaction[+].code = #history-instance
* rest.resource.interaction[+].code = #create
* rest.resource.interaction[+].code = #update
* rest.resource.interaction[+].code = #patch
* rest.resource.interaction[+].code = #delete
* rest.resource.interaction[+].code = #history-type
* rest.resource.searchParam[0].name = "identifier"
* rest.resource.searchParam[=].type = #token
* rest.resource.searchParam[=].documentation = "GET [base]/Practitioner?identifier=http://myhospital.com/fhir/drid|789"
* rest.resource.searchParam[+].name = "name"
* rest.resource.searchParam[=].type = #string
* rest.resource.searchParam[=].documentation = "GET [base]/Practitioner?name=山田"