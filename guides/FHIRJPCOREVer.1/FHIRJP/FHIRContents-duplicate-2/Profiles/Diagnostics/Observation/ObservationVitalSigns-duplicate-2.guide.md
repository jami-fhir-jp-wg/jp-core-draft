---
# 2.1.3.1.2. JP Core Observation（バイタルサイン）プロファイル

## 2.1.3.1.2.1. 概要

| 項目 | 内容 |
| --- | --- |
| 定義URL | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_VitalSigns |
| バージョン | 1.0.0 |
| 名前 | JPCoreObservationVitalSignsProfile |
| タイトル |  JP Core Observation Vital Signs Profile |
| ステータス | アクティブ（2021-11-03） |
| 定義 | このプロファイルは`Observation`リソースにて、患者バイタルサインの１項目を対象として表現するための制約と拡張を定めたものである。 |
| 公開者 | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpobservationvitalsigns |

本プロファイル説明は、患者に付属する一項目分のバイタルサイン情報について、情報の登録や検索、取得のために、FHIR `Observation`リソースを使用するにあたっての、最低限の制約を記述したものである。
`Observation` リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

### 2.1.3.1.2.1.1. 背景および想定シナリオ
本プロファイルは、以下のようなユースケースを想定している。

- `Patient`リソースからの指定された日時、期間での患者バイタルサイン情報の参照
- `Patient`リソースからの指定された患者バイタルサイン項目に対する指定された期間でのバイタルサイン情報の参照
- `Patient`リソースからの標準値を外れた患者バイタルサイン情報の参照
- 指定された期間や患者バイタルサイン項目に対し、条件に合致するバイタルサイン情報、または関連する他のリソース（`Observation`リソースや、`Patient`リソース等）の参照。

### 2.1.3.1.2.1.2. スコープ
`Observtion`はヘルスケアの中心的な要素であり、診断の支援、進捗状況の監視、ベースラインやパターンの決定、さらには人口統計学的特性の把握に使用されます。ほとんどの`Observation`は、いくつかのメタデータを持つ単純な名前/値のペアのアサーションであるが、いくつかの`Observation`は、他の `Observation`を論理的にグループ化したり、あるいはマルチコンポーネントの`Observation`であったりする。

このプロファイルでは上記想定シナリオにて用いられる`Observation`の用途がスコープであり、患者基本情報の中でも特に患者バイタルサインに該当する情報項目の１つを取り扱う際に、必要な要件を定義している。

## 2.1.3.1.2.2. 関連するプロファイル
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
- [`Observation`](ObservationVitalSigns)
- [`Procedure`](Procedure)
- [`QuestionnaireResponse`](https://www.hl7.org/fhir/questionnaireresponse.html)
- [`RequestGroup`](https://www.hl7.org/fhir/requestgroup.html)
- [`RiskAssessment`](https://www.hl7.org/fhir/riskassessment.html)
- [`ServiceRequest`](https://www.hl7.org/fhir/servicerequest.html)
- [`SupplyRequest`](https://www.hl7.org/fhir/supplyrequest.html)


## 2.1.3.1.2.3. リソース定義
- [リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpobservationvitalsigns)
- [リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpobservationvitalsigns/$download?format=json)

{{tree:jp-core-draftv1/jpobservationvitalsigns,snapshot}}


### 2.1.3.1.2.3.1. 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

#### 2.1.3.1.2.3.1.1. 必須
本プロファイルは、次の要素を持たなければならない。

- `status`︓患者バイタルサイン情報項目の状態は必須である。
- `category`︓このリソースが示す患者バイタルサイン情報項目を分類するための区分であり、このプロファイルでは必須とする。
- `code`︓このリソースは何の患者バイタルサイン情報項目であるかを示すため必須である。
- `subject`︓このリソースが示す患者バイタルサイン情報項目が、どの患者のものかを示すため、このプロファイルでは参照する`patient`リソースの定義を必須とする。
- `encouter`：このリソースが示す患者バイタルサイン情報項目が、どの診療イベントにより発生したものかを示すため、このプロファイルでは必須とする。

#### 2.1.3.1.2.3.1.2. Must Support
このプロファイルでは MustSupport要素定義は行っていない。

### 2.1.3.1.2.3.2. Extension定義
このプロファイルでは拡張定義は行っていない。

### 2.1.3.1.2.3.3. 用語定義

| Path | 定義 | バインディング強度 | バリューセット |
|---|---|---|---|
| `Observation.category` | MEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類１．バイタルサインの「焦点」を基にバリューセットを定義する | Preferred | `VitalSignsCategory` |
| `Observation.code` | MEDISの看護実践用語標準マスター＜看護観察編＞の大分類１．バイタルサイン・基本情報、中分類１．バイタルサインを対象とする | Preferred | `VitalSignsCode` |

### 2.1.3.1.2.3.4. 制約一覧

このプロファイルでは制約定義は行っていない。



## 2.1.3.1.2.4. 利用方法

### 2.1.3.1.2.4.1. インタラクション一覧

`Observation`リソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#インタラクション一覧](Observation#ObsInteraction)

### 2.1.3.1.2.4.2. OperationおよびSearch Parameter 一覧

#### 2.1.3.1.2.4.2.1. Search Parameter一覧

バイタルサインユースケースのSearch Parameter一覧は共通情報プロファイルに記載されている。

検索時の`category`パラメータは"vital-sign"となる。

[Observation共通情報プロファイル#Search Parameter一覧](Observation#ObsSearch)

#### 2.1.3.1.2.4.2.2. Operation一覧

`Observation`リソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧](Observation#ObsOperation)

<!--
#### 2.1.3.1.2.4.2.3. サンプル
-->
