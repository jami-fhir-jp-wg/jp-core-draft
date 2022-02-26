このドキュメントは作成中です。

# 2.5.1. JP Core Server Capability Statement

## 2.5.1.1. 概要

この章ではJP Core Requestor[クライアント]から発行される問い合わせに対して応答する責務のある、JP Core Serverに要求される機能(expected capabilities)について記載する。  
JP Core Serverによってサポートされる FHIR プロファイル・RESTful操作・検索パラメータの完全なリストを定義する。  
JP Core Clientは個別のユースケースや意味的な要請に応じてこれらのリストを通じて必要なデータにアクセスすることができる。

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/CapabilityStatement/StructureDefinition/jp-core-server |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreServerCapabilityStatement                                   |
| タイトル       | JP Core Server Capability Statement                              |
| ステータス     | アクティブ（2021-12-01）                                   |
| 定義           | JP Core Server Actorの期待される機能について説明する。 JP Core ServerがサポートするFHIRプロファイル、OperationsおよびSearch Parametersのリストが定義されている。|
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)   |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)   |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpcoreservercapabilitystatement  |

## 2.5.1.2. FHIR RESTful Capabilities
- JP Coreは以下の要件を必須とする(**SHALL**)
  - FHIR仕様に基づくRESTfulなふるまいの実装
- 以下のレスポンスクラスを返すこと
  - (Status 400): invalid parameter
  - (Status 401/4xx): unauthorized request
  - (Status 403): insufficient scope
  - (Status 404): unknown resource
  - (Status 410): deleted resource.

- 全てのJP Core interactionにおいてjson記述をサポートすること(**SHOULD**)  

- JP Coreは以下の要件を満たすべきである(**SHOULD**)
  - 各インスタンス を、FHIR meta.profile 属性の一部としてサポートされる JP Core profileとして認識すること

- JP Coreでは以下の要件を実装しても良い(**MAY**)。
  - 全てのJP Core interactionにおいてXML記述をサポートすること

- セキュリティ  
  - See the General Security Considerations section for requirements and recommendations.
  - サーバーはunauthorizedなリクエストに対してはHTTP 401を返さなければならない。(**SHALL**)

## 2.5.1.4. 検索条件サマリ
|Resource Type|Supported Profiles|Supported Searches|
|---|---|---|
|Patient                   |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient}}|[SHALL] identifier<br/>[SHOULD] name<br/>[SHOULD] birthdate + name<br/>[SHOULD] birthdate + gender<br/>[SHOULD] birthdate + name + gender<br/>[SHOULD] name + phone<br/>[SHOULD] name + address + postalcode<br/>[MAY] family + given + birthdate + gender + phone + address-postalcode|
|Coverage                  |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Coverage}}|[SHOULD] beneficiary<br/>[SHOULD] class-type<br/>[SHOULD] class-value<br/>[SHOULD] dependent<br/>[SHOULD] identifier<br/>[SHOULD] patient<br/>[SHOULD] payor<br/>[SHOULD] policy-holder<br/>[SHOULD] status<br/>[SHOULD] subscriber<br/>[SHOULD] type|
|Encounter                 |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Encounter}}|[SHALL] patient<br/>[SHALL] date + patient<br/>[SHOULD] identifier<br/>[SHOULD] class + patient<br/>[SHOULD] patient + type	<br/>[SHOULD] patient + status|
|Location                  |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Location}}|[SHOULD] name<br/>[SHOULD] address<br/>[SHOULD] address-city<br/>[SHOULD] address-state<br/>[SHOULD] address-postalcode|
|Organization              |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization}}|[SHOULD] identifier<br/>[SHOULD] name<br/>[SHOULD] address|
|Practitioner              |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Practitioner}}|[SHALL] identifier<br/>[SHALL] name|
|PractitionerRole          |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_PractitionerRole}}|[SHALL] specialty<br/>[SHALL] practitioner|
|Medication                |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Medication}} |
|MedicationRequest         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest}}|[SHALL] identifier<br/>[SHOULD] patient<br/>[SHOULD] patient + date<br/>[SHOULD] patient + authoredon<br/>[MAY] date + authoredon + category + code + requester|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest_injection}}|-|
|MedicationDispense        |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense}}|[SHALL] identifier<br/>[SHOULD] patient<br/>[SHOULD] patient + whenhandedover<br/>[MAY] whenhandedover + whenprepared + context + code + performer	|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense_Injection}}|-|
|MedicationAdministration  |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration}}|[SHALL] identifier<br/>[SHOULD] patient<br/>[SHOULD] patient + effective-time<br/>[MAY]code|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_Injection}}|-|
|Observation               |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Common}}|[SHOULD] subject + code + date + based-on<br/>[SHOULD] subject + code + date + value-quantity + based-on<br/>[SHOULD] subject + code + date + value-concept + based-on<br/>[SHOULD] subject + code + date + value-string + based-on<br/>[SHOULD] code + value-quantity + subject<br/>[SHOULD] code + value-concept + subject<br/>[SHOULD] code + value-string + subject<br/>[MAY] patient + category + code + value-quantity<br/>[MAY] patient + category + code + value-quantity + date<br/>[MAY] patient + category + code + value-quantity + encounter|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult}}|-|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_VitalSigns}}|-|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_BodyMeasurement}}|-|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_PhysicalExam}}|-|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_SocialHistory}}|-|
|ImagingStudy              |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Radiology}}|[SHOULD] subject + modality<br/>[SHOULD] subject + bodysite<br/>[SHOULD] subject + started<br/>[SHOULD] subject + started + modality + bodysite<br/>[SHOULD]encounter|
|DiagnosticReport          |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Common}}|[SHOULD] subject + category<br/>[SHOULD] subject + category + based-on<br/>[SHOULD] subject + category + date<br/>[MAY]based-on + category + code + conclusion + date + encounter + identifier + issued + media + performer + result + results-interpreter + status + subject|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_LabResult}}|-|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Radiology}}|-|
|AllergyIntolerance        |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_AllergyIntolerance}}|[SHALL] patient<br/>[SHALL] patient + date<br/>[SHOULD] patient + clinicalstatus<br/>[SHOULD] patient + verificationstatus<br/>[SHOULD] patient + type<br/>[SHOULD] patient + category<br/>[SHOULD] patient + criticality
|Condition                 |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Condition}}|[SHALL] patient<br/>[SHALL] patient + date<br/>[SHOULD] patient + clinicalstatus<br/>[SHOULD] patient + verificationstatus<br/>[SHOULD] patient + category|
|Procedure                 |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Procedure}}|[SHALL] patient<br/>[SHALL] patient + date|


## 2.5.1.4. RESTful Capabilities by Resource/Profile:

Capablity Statementリソースは{{link:http://jpfhir.jp/fhir/core/CapabilityStatement/StructureDefinition/JP_ServerCapabilityStatement}}より参照すること。

{{render:http://jpfhir.jp/fhir/core/CapabilityStatement/StructureDefinition/JP_ServerCapabilityStatement}}
<!--
- システムは以下のインタラクションをサポートしても良い(**MAY**)。
  - transaction interaction.
  - batch interaction.
  - search-system interaction.
  - history-system interaction.

|Resource Type|Supported Profiles|Supported Searches|SWG|
|----|----|----|----|----|
|AllergyIntolerance|[JP_AllergyIntolerance](https://simplifier.net/jp-core-draftv1/jpallergyintolerance)||SWG4|
|Appointment|[JP_Appointment](https://simplifier.net/jp-core-draftv1/jpappointment)||SWG4|
|AppointmentResponse|[JP_AppointmentResponse](https://simplifier.net/jp-core-draftv1/jpappointmentresponse)||SWG4|
|CarePlan|||SWG4|
|CareTeam|||SWG4|
|Condition|[JP_Condition](https://simplifier.net/jp-core-draftv1/jpcondition)|||
|Coverage|[JP_Coverage](https://simplifier.net/jp-core-draftv1/jpcoverage)|||
|Device||||
|DiagnosticReport||||
|DocumentReference||||
|Encounter|[JP_Encounter](https://simplifier.net/jp-core-draftv1/jpencounter)||SWG3|
|Goal||||
|Immunization|[JP_Immunization](https://simplifier.net/jp-core-draftv1/jpimmunization)|||
|Location|[JP_Location](https://simplifier.net/jp-core-draftv1/jplocation)||SWG3|
|||||
|MedicationDispense|[JP_MedicationAdministration](https://simplifier.net/jp-core-draftv1/jpmedicationdispense)|patient+status|SWG5|
|MedicationRequest|[JP_MedicationRequest](https://simplifier.net/jp-core-draftv1/jpmedicationrequest)|patient+medication|SWG5|
|||||
|Observation|[JP_Observation](https://simplifier.net/jp-core-draftv1/jpobservation),<br>[JP_Observation_BodyMeasurement](https://simplifier.net/jp-core-draftv1/jpobservationbodymeasurement),<br>[JP_Observation_LabResult](https://simplifier.net/jp-core-draftv1/jpobservationlabresult),<br>[JP_Observation_Microbiology](https://simplifier.net/jp-core-draftv1/jpobservationmicrobiology),<br>[JP_Observation_PhysicalExam](https://simplifier.net/jp-core-draftv1/jpobservationphysicalexam),<br>[JP_Observation_SocialHistory](https://simplifier.net/jp-core-draftv1/jpobservationsocialhistory),<br>[JP_Observation_VitalSigns](https://simplifier.net/jp-core-draftv1/jpobservationvitalsigns)||SWG2|
|Organization|[JP_Organization](https://simplifier.net/jp-core-draftv1/jporganization)||SWG3|
|[Patient](#patient)|[JP_Patient](https://simplifier.net/jp-core-draftv1/jppatient)|identifier, name, birthdate+name, birthdate+gender, birthdate+name+gender, name+phone, name+address-postalcode, family+given+birthdate+gender+phone+address-postalcode|SWG3|
|Practitioner|[JP_Practitioner](https://simplifier.net/jp-core-draftv1/jppractitioner)||SWG3|
|PractitionerRole|[JP_PractitionerRole](https://simplifier.net/jp-core-draftv1/jppractitionerrole)||SWG3|
|Procedure|[JP_Procedure](https://simplifier.net/jp-core-draftv1/jpprocedure)|||
|Provenance||||
|Schedule|[JP_Schedule](https://simplifier.net/jp-core-draftv1/jpschedule)||SWG3|
|Slot|[JP_Slot](https://simplifier.net/jp-core-draftv1/jpslot)||SWG3|
|ValueSet||||


## 2.5.1.4. Patient<a name="patient"></a>

Conformance Expectation: **SHALL**

Supported Profiles: [JP_Patient Profile](https://simplifier.net/fhirjpigwg/jppatient)

Reference Policy: resolves

Profile Interaction Summary:
- **SHALL** support search-type, read.
- **SHOULD** support vread, history-instance.
- **MAY** support create, update, patch, delete, history-type.

Fetch and Search Criteria:

- A Server **SHALL** be capable of returning a Patient resource using:  
  `GET [base]/Patient/[id]`
- A Server **SHALL** be capable of supporting the following _revincludes:  
  `Provenance:target - GET [base]/Patient?[parameter=value]&_revinclude=Provenance:target`


Search Parameter Summary:

|Conformance|Parameter|Type|Example|
|----|----|----|----|
|**SHALL**|identifier|token|`GET [base]/Patient?identifier=[identifier]`|
|**SHOULD**|name|string|`GET [base]/Patient?name=[name]`|

Search Parameter Combination Summary:

|Conformance|Parameter Combination|Type|Example|
|----|----|----|----|
|**SHOULD**|birthdate+name|[date](http://hl7.org/fhir/search.html#date)+[string](http://hl7.org/fhir/search.html#string)|`GET [base]/Patient?birthdate=[birthdate]&name=[name]`|
|**SHOULD**|birthdate+gender|date+[token](http://hl7.org/fhir/search.html#token)|`GET [base]/Patient?birthdate=[birthdate]&gender=[system]|[code]`|
|**SHOULD**|birthdate+name+gender|date+string+token|`GET [base]/Patient?birthdate=[birthdate]&name=[name]&gender=[system]|[code]`|
|**SHOULD**|name+phone|string+token|`GET [base]/Patient?name=[name]&phone=[system]|[code]`|
|**SHOULD**|name+address-postalcode|string+string|`GET [base]/Patient?name=[name]&address-postalcode=[address-postalcode]`|
|**MAY**|family+given+birthdate+gender+phone+address-postalcode|string+string+date+token+token+string||
-->
