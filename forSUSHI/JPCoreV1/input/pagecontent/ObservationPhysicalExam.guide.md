# 2.1.3.1.4. JP Core Observation（身体所見）プロファイル

## 2.1.3.1.4.1. 概要

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_PhysicalExam |
| バージョン     | 1.0.0 |
| 名前           | JPCoreObservationPhysicalExamProfile |
| タイトル       | JP Core Observation PhysicalExam Profile |
| ステータス     | アクティブ（2021-11-03）|
| 定義           | このプロファイルはObservationリソースに対して、身体所見のデータを送受信するための制約と拡張を定めたものである。 |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpobservationphysicalexam |

本プロファイル説明は、患者に付属する一項目分の身体所見情報について、情報の登録や検索、取得のために、FHIR `Observation`リソースを使用するにあたっての、最低限の制約を記述したものである。

`Observation`リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

## 2.1.3.1.4.2. 背景および想定シナリオ
本プロファイルは、以下のようなユースケースを想定している。

- `Patient`リソースからの指定された日時、期間での身体所見情報の参照
- `Patient`リソースからの指定された診察方法に対する指定された期間での身体所見情報の参照


### 2.1.3.1.4.2.1. スコープ
`Observtion`はヘルスケアの中心的な要素であり、診断の支援、進捗状況の監視、ベースラインやパターンの決定、さらには人口統計学的特性の把握に使用されます。ほとんどの`Observation`は、いくつかのメタデータを持つ単純な名前/値のペアのアサーションであるが、いくつかの`Observation`は、他の`Observation`を論理的にグループ化したり、あるいはマルチコンポーネントの`Observation`であったりする。

このプロファイルでは上記想定シナリオにて用いられる`Observation`の用途がスコープであり、患者基本情報の中でも特に身体所見に該当する情報項目の１つを取り扱う際に、必要な要件を定義している。

## 2.1.3.1.4.3. 関連するプロファイル
このプロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

- [`AdverseEvent`](https://www.hl7.org/fhir/adverseevent.html)
- [`Appointment`](https://www.hl7.org/fhir/appointment.html)
- [`CarePlan`](https://www.hl7.org/fhir/careplan.html)
- [`ChargeItem`](https://www.hl7.org/fhir/chargeitem.html)
- [`ClinicalImpression`](https://www.hl7.org/fhir/clinicalimpression.html)
- [`Communication`](https://www.hl7.org/fhir/communication.html)
- [`CommunicationRequest`](https://www.hl7.org/fhir/communicationrequest.html)
- [`Condition`](Condition)
- [`Contract`](https://www.hl7.org/fhir/contract.html)
- [`DeviceRequest`](https://www.hl7.org/fhir/devicerequest.html)
- [`DeviceUseStatement`](https://www.hl7.org/fhir/deviceusestatement.html)
- [`DiagnosticReport`](DiagnosticReport)
- [`Encounter`](Encounter)
- [`FamilyMemberHistory`](https://www.hl7.org/fhir/familymemberhistory.html)
- [`Goal`](https://www.hl7.org/fhir/goal.html)
- [`GuidanceResponse`](https://www.hl7.org/fhir/guidanceresponse.html)
- [`ImagingStudy`](ImagingStudy2)
- [`Immunization`](https://www.hl7.org/fhir/immunization.html)
- [`MedicationAdministration`](https://www.hl7.org/fhir/medicationadministration.html)
- [`MedicationRequest`](https://www.hl7.org/fhir/MedicationRequest.html)
- [`MedicationStatement`](https://www.hl7.org/fhir/medicationstatement.html)
- [`MolecularSequence`](https://www.hl7.org/fhir/molecularsequence.html)
- [`Observation`](ObservationPhysicalExam)
- [`Procedure`](ObservationProcedure)
- [`QuestionnaireResponse`](https://www.hl7.org/fhir/questionnaireresponse.html)
- [`RequestGroup`](https://www.hl7.org/fhir/requestgroup.html)
- [`RiskAssessment`](https://www.hl7.org/fhir/riskassessment.html)
- [`ServiceRequest`](https://www.hl7.org/fhir/servicerequest.html)
- [`SupplyRequest`](https://www.hl7.org/fhir/supplyrequest.html)


このプロファイルは、以下のリソースに対して定義された各プロファイルを直接参照する可能性がある。

- [`Encounter`](Encounter)
- [`Patient`](Patient)
- [`Practitioner`](Practitioner)

## 2.1.3.1.4.4. リソース定義

[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpobservationphysicalexam)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpobservationphysicalexam/$download?format=json)

{{tree:jp-core-draftv1/jpobservationphysicalexam,snapshot}}


### 2.1.3.1.4.4.1. 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

#### 2.1.3.1.4.4.1.1. 必須
本プロファイルでは、次の要素を持たなければならない。

- `status`︓身体所見情報項目の状態は必須である。
- `category`︓このリソースが示す身体所見情報項目を分類するための区分であり、このプロファイルでは必須とする。
- `code`︓このリソースは何の身体所見情報項目であるかを示すため必須である。
- `subject`︓このリソースが示す身体所見情報項目が、どの患者のものかを示すため、このプロファイルでは参照するpatientリソースの定義を必須とする。
- `encouter`：このリソースが示す身体所見情報項目が、どの診療イベントにより発生したものかを示すため、このプロファイルでは必須とする。

#### 2.1.3.1.4.4.1.2. Must Support
このプロファイルでは MustSupport要素定義は行っていない。

### 2.1.3.1.4.4.2. Extensions定義
本プロファイルで使用される拡張は次の通りである。

- [`JPCoreBodySitePositionExtension`](https://simplifier.net/jp-core-draftv1/jpobservationbodysiteposition)
  - 部位（bodySite）の左右の区別を表現する際に使用する。

### 2.1.3.1.4.4.3. 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `Observation.category` | 「exam」固定 | Preferred | [`ObservationCategoryCodes`](https://hl7.org/fhir/valueset-observation-category.html) |
| `Observation.code` | 所見の有無を表すコード（固定値） | Required | [`ObservationPhysicalExam`](https://simplifier.net/jp-core-draftv1/jpobservationphysicalexamcode) |
| `Observation.value[x]` | コードに限定する | Required | [`Hl7VSYesNoIndicator`](http://terminology.hl7.org/ValueSet/v2-0136) |
| `Observation.bodySite` | 外保連の操作対象部位を基にバリューセットを定義する。左右の区別は拡張で表現する | Preferred | `ObservationBodySite` |
| `Observation.method` | MEDIS症状・所見マスターの「診察方法」を基にバリューセットを定義する | Preferred | `ObservationMethod` |
| `Observation.component.code` | 具体的な所見を表すコード（固定値） | Required | [`ObservationPhysicalExam`](https://simplifier.net/jp-core-draftv1/jpobservationphysicalexamcode) |

### 2.1.3.1.4.4.4. 制約一覧

このプロファイルでは制約定義は行っていない。


## 2.1.3.1.4.5. 利用方法

### 2.1.3.1.4.5.1. インタラクション一覧

Observationリソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#インタラクション一覧](Observation#ObsInteraction)

### 2.1.3.1.4.5.2. OperationおよびSearch Parameter 一覧

#### 2.1.3.1.4.5.2.1. Search Parameter一覧

身体所見ユースケースのSearch Parameter一覧は共通情報プロファイルに記載されている。

検索時の`category`パラメータは"exam"となる。

[Observation共通情報プロファイル#Search Parameter一覧](Observation#ObsSearch)

#### 2.1.3.1.4.5.2.2. Operation一覧

`Observation`リソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧](Observation#ObsOperation)

#### 2.1.3.1.4.5.2.3. サンプル
```json
{
  "resourceType": "Observation",
  "id": "jp-observation-physicalexam",
  "status": "final",
  "category": [
    {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/observation-category",
          "code": "exam",
          "display": "Exam"
        }
      ]
    }
  ],
  "code": {
    "coding": [
      {
        "system": "http://jpfhir.jp/fhir/Common/CodeSystem/observation-physicalExam",
        "code": "physical-findings",
        "display": "Physical Findings"
      }
    ]
  },
  "subject": {
    "reference": "http://jpfhir.jp/fhir/Patient/jp-patient"
  },
  "encounter": {
    "reference": "http://jpfhir.jp/fhir/Encounter/jp-encounter"
  },
  "effectiveDateTime": "2021-07-09T17:00:00+09:00",
  "valueCodeableConcept": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0532",
        "code": "Y",
        "display": "Yes"
      }
    ]
  },
  "bodySite": {
    "extension": [
      {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_Observation_BodySite_BodySitePosition",
        "valueString": "右"
      }
    ],
    "coding": [
      {
        "system": "http://jpfhir.jp/fhir/Common/CodeSystem/observation-bodySite",
        "code": "TBD",
        "display": "下腹部"
      }
    ]
  },
  "method": {
    "coding": [
      {
        "system": "http://jpfhir.jp/fhir/Common/CodeSystem/observation-method",
        "code": "TBD",
        "display": "触診"
      }
    ]
  },
  "component": [
    {
      "code": {
        "coding": [
          {
            "system": "http://jpfhir.jp/fhir/Common/CodeSystem/observation-physicalExam",
            "code": "detailed-physical-findings",
            "display": "Detailed Physical Findings"
          }
        ]
      },
      "valueString": "圧痛あり"
    }
  ]
}
```
