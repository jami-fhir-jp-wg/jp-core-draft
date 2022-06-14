# 2.5.2. JP Core Client ClientCapabilityStatements
---

## 2.5.2.1. 概要

この章ではJP Core Clientの期待される機能について説明する。
JP Core Serverによってサポートされる FHIR プロファイル・RESTful操作・検索パラメータの完全なリストを定義する。  
JP Core Clientは個別のユースケースや意味的な要請に応じてこれらのリストを通じて必要なデータにアクセスすることができる。

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/CapabilityStatement/StructureDefinition/jpcoreclientcapabilitystatement |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreClientCapabilityStatement                                   |
| タイトル       | JP Core Client Capability Statement                              |
| ステータス     | アクティブ（2021-12-01）                                   |
| 定義           | JP Core Clientの期待される機能について説明する。JP Core Clientは、ローカルなユースケースやその他の文脈上の要件に基づいて、必要なデータにアクセスするために、このリストから選択することができます。|
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)   |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)   |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpcoreclientcapabilitystatement |

## 2.5.2.2. FHIR RESTful Capabilities
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


## 2.5.2.3. 検索条件サマリ
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

## 2.5.2.4. RESTful Capabilities by Resource/Profile:
Capablity Statementリソースは{{link:http://jpfhir.jp/fhir/core/CapabilityStatement/StructureDefinition/jpcoreclientcapabilitystatement}}より参照すること。

{{render:http://jpfhir.jp/fhir/core/CapabilityStatement/StructureDefinition/jpcoreclientcapabilitystatement}}