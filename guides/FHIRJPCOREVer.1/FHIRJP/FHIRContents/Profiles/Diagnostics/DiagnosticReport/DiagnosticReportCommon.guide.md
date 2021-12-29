# 2.1.3.3.0. JP Core DiagnosticReport (共通) プロファイル

## 2.1.3.3.0.1. 概要

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_Common |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreDiagnosticReportCommonProfile |
| タイトル       | JP Core Diagnostic Report Common Profile |
| ステータス     | アクティブ（2021-11-03）                                   |
| 定義           | このプロファイルは`DiagnosticReport`リソースに対して、データを送受信するための共通の制約と拡張を定めたものである。 |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      |FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpdiagnosticreportcommon/ |

## 2.1.3.3.0.2. 背景および想定シナリオ

`DiagnosticReport`（検査レポート）リソースは、患者、患者のグループ、デバイス、場所、および/またはこれらから派生した検体に対する検査結果と解釈について記載されるリソースである。`DiagnosticReport`リソースに対する主な用途（プロファイル）は以下の通りである。

- 検体検査
- 細菌検査
- 放射線検査
- 病理検査
- 歯科口腔検査

本プロファイルは、これらプロファイルに共通となる制約、拡張などのプロファイル定義と利用方法等について記述している。

なお、`DiagnosticReport`リソースは蓄積された結果の表示（例えば過去および現在のレポートの結果一覧の表示）をサポートしていない。連続的に作成された詳細な構造化レポートを完全にサポートすることは現時点ではできておらず、将来のリリースで実現するように計画されている。

また、`DiagnosticReport`リソースは、FHIRのワークフロー([`Workflow`を参照](http://www.hl7.org/fhir/workflow.html)）の観点からは、「イベント」リソースの１つである。このリソース（`DiagnosticReport`）を、[イベントリソース](http://www.hl7.org/fhir/workflow.html#event)のワークフローパターンに合わせることは、`Orders`や`Observation Workgroup`が意図するところである。

### 2.1.3.3.0.2.1. スコープ
多くの診断プロセスは、`Observation`（検査、観察）と`DiagnosticReport`（検査レポート）を生成する手続きである点に留意する必要がある。多くの場合、`Observation`を作成するために明示的に手続きの発行を要しないが、診断手順がどのように実行されたかについての詳細な関心がある場合、[`Procedure`](http://www.hl7.org/fhir/procedure.html)リソースが行為を記述するために使用される。

[`Observation`](http://www.hl7.org/fhir/observation.html)リソースとは 対照的に、`DiagnosticReport`リソースには通常、追加の臨床コンテキスト、いくつかの小さな所見のまとめ、画像、画像レポート、テキストおよびコード化された解釈、テンプレート化された診断報告書などが含まれる。検査レポート、病理レポート、および画像レポートは、`DiagnosticReport`リソースを使用して表す必要がある。`Observation`リソースは、特定の検査におけるいくつかの小さな所見のまとめを提供するために`DiagnosticReport`から参照される。

高度に構造化されたレポートがある場合は、データとワークフローをサポートする`DiagnosticReport`を使用する。診断調査のリクエストに関する詳細は、さまざまな「リクエスト」リソース（[`ServiceRequest`など](http://www.hl7.org/fhir/servicerequest.html)）に取り込まれ、レポートを臨床ワークフローに接続できるようにする。組織診、剖検などにおいて、少ないワークフローでナラティブに書き起こされるレポートの場合は、[`Composition`リソース](http://www.hl7.org/fhir/composition.html)の方が適切である。

レポートに関連する医用画像や汎用画像、およびキー画像は、`DiagnosticReport`リソースで参照される。詳細でかつ実際の画像インスタンスは、`DiagnosticReport.media`エレメントを使用して検査レポートで直接参照するか、`DiagnosticReport.ImagingStudy`エレメントを介して、特定の患者のDICOM画像検査またはDICOMインスタンスのセットで生成されたコンテンツを表す[`ImagingStudy`リソース](http://www.hl7.org/fhir/imagingstudy.html)を間接的に参照することができる。


## 2.1.3.3.0.3. 関連するプロファイル
このプロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

- [`CarePlan`](https://www.hl7.org/fhir/careplan.html)
- [`ChargeItem`](https://www.hl7.org/fhir/chargeitem.html)
- [`ClinicalImpression`](https://www.hl7.org/fhir/clinicalimpression.html)
- [`Communication`](https://www.hl7.org/fhir/communication.html)
- [`CommunicationRequest`](https://www.hl7.org/fhir/communicationrequest.html)
- [`Condition`](Condition)
- [`Contract`](https://www.hl7.org/fhir/contract.html)
- [`DeviceRequest`](https://www.hl7.org/fhir/devicerequest.html)
- [`DeviceUseStatement`](https://www.hl7.org/fhir/deviceusestatement.html)
- [`FamilyMemberHistory`](https://www.hl7.org/fhir/familymemberhistory.html)
- [`GuidanceResponse`](https://www.hl7.org/fhir/guidanceresponse.html)
- [`ImagingStudy`](ImagingStudy2)
- [`Immunization`](https://www.hl7.org/fhir/immunization.html)
- [`MedicationAdministration`](https://www.hl7.org/fhir/medicationadministration.html)
- [`MedicationStatement`](https://www.hl7.org/fhir/medicationstatement.html)
- [`Procedure`](Procedure)
- [`RequestGroup`](https://www.hl7.org/fhir/requestgroup.html)
- [`RiskAssessment`](https://www.hl7.org/fhir/riskassessment.html)
- [`ServiceRequest`](https://www.hl7.org/fhir/servicerequest.html)
- [`SupplyRequest`](https://www.hl7.org/fhir/supplyrequest.html)

## 2.1.3.3.0.4. プロファイル定義

- [プロファイル定義ページの参照](https://simplifier.net/jp-core-draftv1/jpdiagnosticreport)
- [プロファイル定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpcorediagnosticreportcommonprofile/$download?format=json)

{{tree:jp-core-draftv1/jpcorediagnosticreportcommonprofile,snapshot}}


### 2.1.3.3.0.4.1. 用語定義

| Path | 定義 | バインディング強度 | バリューセット |
| --- | --- | --- | --- |
| `DiagnosticReport.status` | 検査レポートの状態 | Required | [`DiagnosticReportStatus`](https://www.hl7.org/fhir/valueset-diagnostic-report-status.html) |
| `DiagnosticReport.category` | 検査サービスセクションのコード | Example | [`DiagnosticServiceSectionCodes`](https://www.hl7.org/fhir/valueset-diagnostic-service-sections.html) |
| `DiagnosticReport.code` | 検査レポートを記述するコード | Preferred | [`LOINCDiagnosticReportCodes`](https://www.hl7.org/fhir/valueset-report-codes.html) |
| `DiagnosticReport.conclusionCode` | レポートの補助として提供される診断コード | Example | [`SNOMEDCTClinicalFindings`](https://www.hl7.org/fhir/valueset-clinical-findings.html) |

### 2.1.3.3.0.4.2. Interaction一覧 <a name="DxReportInteraction">link</a>

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

## 2.1.3.3.0.5. 利用方法

各ユースケースのプロファイルを参照のこと。
<!--
### 2.1.3.3.0.5.1. インタラクション一覧

### 2.1.3.3.0.5.2. OperationおよびSearch Parameter 一覧

#### 2.1.3.3.0.5.2.1. Search Parameter一覧

#### 2.1.3.3.0.5.2.2. Operation一覧
-->

<!--
#### 2.1.3.3.0.5.2.3. サンプル
-->
