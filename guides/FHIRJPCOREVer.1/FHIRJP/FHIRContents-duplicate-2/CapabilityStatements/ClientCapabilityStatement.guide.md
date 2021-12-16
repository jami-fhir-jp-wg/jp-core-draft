(作成中)

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
|Patient                   |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient}}|[MAY] identifier<br/>[MAY] name<br/>[MAY] birthdate + name<br/>[MAY] birthdate + gender<br/>[MAY] birthdate + name + gender<br/>[MAY] name + phone<br/>[MAY] name + address + postalcode<br/>[MAY] family + given + birthdate + gender + phone + address-postalcode|
|Coverage                  |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Coverage}}|[MAY] beneficiary + reference<br/>[MAY] class-type<br/>[MAY] class-value<br/>[MAY] dependent<br/>[MAY] identifier<br/>[MAY] patient<br/>[MAY] payor<br/>[MAY] policy-holder<br/>[MAY] status + token<br/>[MAY] subscriber<br/>[MAY] type|
|Encounter                 |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Encounter}}|[MAY] patient<br/>[MAY] date + patient<br/>[MAY] identifier<br/>[MAY] class + patient<br/>[MAY] patient + type	<br/>[MAY] patient + status|
|Location                  |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Location}}|[MAY] name<br/>[MAY] address<br/>[MAY] address-city<br/>[MAY] address-state<br/>[MAY] address-postalcode|
|Organization              |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Organization}}|[MAY] identifier<br/>[MAY] name<br/>[MAY] address|
|Practitioner              |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Practitioner}}|[MAY] identifier<br/>[MAY] name|
|PractitionerRole          |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_PractitionerRole}}|[MAY] specialty<br/>[MAY] practitioner|
|Medication                |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Medication}} |
|MedicationRequest         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest}}|[MAY] identifier<br/>[MAY] patient<br/>[MAY] patient + date<br/>[MAY] patient + authoredon<br/>[MAY] date + authoredon + category + code + requester|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest_injection}}|-|
|MedicationDispense        |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense}}|[MAY] identifier<br/>[MAY] patient<br/>[MAY] patient + whenhandedover<br/>[MAY] whenhandedover + whenprepared + context + code + performer	|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense_Injection}}|-|
|MedicationAdministration  |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration}}|[MAY] identifier<br/>[MAY] patient<br/>[MAY] patient + effective-time<br/>[MAY]code|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_Injection}}|-|
|Observation               |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Common}}|[MAY] subject + code + date + based-on<br/>[MAY] subject + code + date + value-quantity + based-on<br/>[MAY] subject + code + date + value-concept + based-on<br/>[MAY] subject + code + date + value-string + based-on<br/>[MAY] code + value-quantity + subject<br/>[MAY] code + value-concept + subject<br/>[MAY] code + value-string + subject<br/>[MAY] patient + category + code + value-quantity<br/>[MAY] patient + category + code + value-quantity + date<br/>[MAY] patient + category + code + value-quantity + encounter|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult}}|-|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_VitalSigns}}|-|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_BodyMeasurement}}|-|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_PhysicalExam}}|-|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_SocialHistory}}|-|
|ImagingStudy              |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_ImagingStudy_Radiology}}|[MAY] subject + modality<br/>[MAY] subject + bodysite<br/>[MAY] subject + started<br/>[MAY] subject + started + modality + bodysite<br/>[MAY]encounter|
|DiagnosticReport          |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Common}}|[MAY] subject + category<br/>[MAY] subject + category + based-on<br/>[MAY] subject + category + date<br/>[MAY]based-on + category + code + conclusion + date + encounter + identifier + issued + media + performer + result + results-interpreter + status + subject|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_LabResult}}|-|
|-                         |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Radiology}}|-|
|AllergyIntolerance        |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_AllergyIntolerance}}|[MAY] patient<br/>[MAY] patient + date<br/>[MAY] patient + clinicalstatus<br/>[MAY] patient + verificationstatus<br/>[MAY] patient + type<br/>[MAY] patient + category<br/>[MAY] patient + criticality
|Condition                 |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Condition}}|[MAY] patient<br/>[MAY] patient + date<br/>[MAY] patient + clinicalstatus<br/>[MAY] patient + verificationstatus<br/>[MAY] patient + category|
|Procedure                 |{{link:http://jpfhir.jp/fhir/core/StructureDefinition/JP_Procedure}}|[MAY] patient<br/>[MAY] patient + date|

## 2.5.2.4. RESTful Capabilities by Resource/Profile:
Capablity Statementリソースは{{link:http://jpfhir.jp/fhir/core/CapabilityStatement/StructureDefinition/jpcoreclientcapabilitystatement}}より参照すること。

{{render:http://jpfhir.jp/fhir/core/CapabilityStatement/StructureDefinition/jpcoreclientcapabilitystatement}}