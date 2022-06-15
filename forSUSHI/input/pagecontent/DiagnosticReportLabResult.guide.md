# 2.1.3.3.1. JP Core DiagnosticReport 検体検査レポート用プロファイル

## 2.1.3.3.1.1. 概略


| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_DiagnosticReport_LabResult |
| バージョン     | 1.0.0                                                      |
| 名前           | JPDiagnosticReportLabResult                                   |
| タイトル       | JP Core Diagnostic Report Lab Result Profile |
| ステータス     | アクティブ（2021-11-03）                                   |
| 定義           | このプロファイルは[`DiagnosticReport`](DiagnosticReport#Common2)リソースに関し検体検査の１項目を対象として表現し、データを送受信するための基礎となる制約と拡張を定めたものである。 |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)|
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpdiagnosticreportlabresult |


本プロファイルは、患者に関連付けられた検査結果を記録、検索、および取得するための`DiagnosticReport`リソースを使用するにあたっての、最低限の制約を記述したものである。またこのプロファイルを使用するときに、どの要素、拡張機能、語彙、および値セットがリソースに存在する必要があるかを示す。

検体検査結果は、通常は`Observation`リソースを参照する`DiagnosticReport`リソースを使用してグループ化および要約されたものである。

各`Observation`リソースは、個々の検体検査と結果値またはコンポーネントの結果値を表す。 また、レポート形式またはフリーテキストで表示することもできる。


## 2.1.3.3.1.2. 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

 - 患者に属する検体検査レポートの参照
 <!--
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査オーダの依頼科での検体検査情報の参照
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査結果値（範囲、または範囲外）検査オーダの依頼科での検体検査情報の参照
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査結果値（特定のコード）検査オーダの依頼科での検体検査情報の参照
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査結果値（特定の文字列）検査オーダの依頼科での検体検査情報の参照
 - 検査項目、検査結果値に対し条件に合致する検体検査情報、または関連する他のリソース（`Observation`リソースや、`Patient`リソース等）の参照。
-->
### 2.1.3.3.1.2.1. スコープ

多くの診断プロセスは、観察（`Observation`）と診断レポート（`DiagnosticReport`）を生成する手続きである点に留意する必要がある。

[`Observation`リソース](http://www.hl7.org/fhir/observation.html)とは 対照的に、`DiagnosticReport`リソースには通常、いくつかの所見、画像、画像レポート、テキストおよびコード化された解釈、テンプレート化された報告書などが含まれる。検体検査レポートは、`DiagnosticReport`リソースを使用して表す必要がある。`Observation`リソースは、特定の調査のいくつかの小さな所見のまとめを提供するために`DiagnosticReport`から参照される。

<!--
 `Observtion`はヘルスケアの中心的な要素であり、診断の支援、進捗状況の監視、ベースラインやパターンの決定、さらには人口統計学的特性の把握に使用されます。ほとんどの`Observation`は、いくつかのメタデータを持つ単純な名前/値のペアのアサーションであるが、いくつかの`Observation`は、他の`Observation`を論理的にグループ化したり、あるいはマルチコンポーネントの`Observation`であったりする。

このプロファイルでは上記想定シナリオにて用いられる`Observation`の用途がスコープであり、患者基本情報の中でも特に検体検査に該当する情報項目の１つを取り扱う際に、必要な要件を定義している。
-->
### 2.1.3.3.1.2.2. 関連するプロファイル

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
- [`ImagingStudy`](https://www.hl7.org/fhir/imagingstudy.html)
- [`Immunization`](https://www.hl7.org/fhir/immunization.html)
- [`MedicationAdministration`](https://www.hl7.org/fhir/medicationadministration.html)
- [`MedicationStatement`](https://www.hl7.org/fhir/medicationstatement.html)
- [`Procedure`](Procedure)
- [`RequestGroup`](https://www.hl7.org/fhir/requestgroup.html)
- [`RiskAssessment`](https://www.hl7.org/fhir/riskassessment.html)
- [`ServiceRequest`](https://www.hl7.org/fhir/servicerequest.html)
- [`SupplyRequest`](https://www.hl7.org/fhir/supplyrequest.html)



## 2.1.3.3.1.3. リソース定義

- [リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpdiagnosticreportlabresult)

- [リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpdiagnosticreportlabresult/$download?format=json)

 {{tree:jp-core-draftv1/jpdiagnosticreportlabresult,snapshot}}

### 2.1.3.3.1.3.1. 必須要素 

次のデータ項目はデータが存在しなければならない（必須）であるか、あるいは、データが送信システムに存在する場合はサポートされなければならない（Must Support）要素である。

#### 2.1.3.3.1.3.1.1. 必須
`DiagnosticReport`リソースは、次の要素を持たなければならない。

 - `status`︓検体検査情報項目の状態は必須である。
 - `code`︓このリソースは何の検体検査情報項目であるかを示すため必須である。


#### 2.1.3.3.1.3.1.2. MustSupport
このプロファイルではMustSupportMustSupportを定めていない。


### 2.1.3.3.1.3.2. Extensions定義

このプロファイルでは拡張定義は行っていない。




<!--
## 2.1.3.3.1.4. 注意事項
(全体に対する注意事項等、その他の部分について記載します。）## 
-->


### 2.1.3.3.1.4.1. 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `DiagnosticReport.status` | レポートのステータス | Required | [`DiagnosticReportStatus`](http://hl7.org/fhir/valueset-diagnostic-report-status.html) |
| `DiagnosticReport.category` | レポート（所見）を作成した部門 | Preferred | [`DiagnosticServiceSectionCodes`](http://hl7.org/fhir/ValueSet/diagnostic-service-sections)<br>"RAD", "RX", "CT", "NMR", "NMS", "RUS", "VUS", "OUS", "CUS"などを指定。デフォルトは"LAB"。 |


## 2.1.3.3.1.5. 利用方法

### 2.1.3.3.1.5.1. Interaction一覧 
`DiagnosticReport` リソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。


[DiagnosticReport共通情報プロファイル#インタラクション一覧](DiagnosticReport#DxReportInteraction)



### 2.1.3.3.1.5.2. OperationおよびSearch Parameter 一覧
#### 2.1.3.3.1.5.2.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD | `subject`,`category` | `reference`  | `GET [base]/DiagnosticReport?subject=Patient/123&category=LAB` |
| SHOULD | `subject`,`category`,`based-on` | `reference`,`reference`  | `GET [base]/DiagnosticReport?subject=Patient/123&category=LAB&based-on=ServiceRequest/456` |
| SHOULD | `subject`,`category`,`date` | `reference`,`date`  | `GET [base]/Observation?subject=Patient/123&category=LAB&date=le2020-12-31` |

##### 2.1.3.3.1.5.2.1.1. 必須検索パラメータ

このプロファイルでは必須（SHALL）としての検索項目は定義していない。

##### 2.1.3.3.1.5.2.1.2. 推奨検索パラメータ

次の検索パラメータはサポートすることが推奨される。（SHOULD）

1. 臨床での検索：subject = Patient（対象患者）、category(対象レポートカテゴリ)を指定した検索をサポートすることが望ましい。（SHOULD）


`subject`の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/DiagnosticReport?subject={reference}&category={token}
   ```

   例：

   ```
   GET [base]/DiagnosticReport?subject=Patient/123&category=LAB
   ```

2. 臨床での検索：subject = Patient（対象患者）、category(対象レポートカテゴリ)、based-on (検査オーダの依頼科)を指定した検索をサポートすることが望ましい。（SHOULD）


`subject`,`based-on`の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/DiagnosticReport?subject={reference}&category={token}&based-on={reference}
   ```

   例：

   ```
   GET [base]/DiagnosticReport?subject=Patient/123&category=LAB&based-on=ServiceRequest/456
   ```

3. 臨床での検索：subject = Patient（対象患者）、category(対象レポートカテゴリ)、date(レポート作成日)を指定した検索をサポートすることが望ましい。（SHOULD）


`subject`,`date`の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/DiagnosticReport?subject={reference}&category={token}&date={date}
   ```

   例：

   ```
   GET [base]/DiagnosticReport?subject=Patient/123&category=LAB&date=2021-11-08
   ```

#### 2.1.3.3.1.5.2.2. オプション検索パラメータ
このプロファイルでは、オプション検索パラメータ(MAY)は定義していない。

### 2.1.3.3.1.5.3. Operation一覧
このプロファイルではOperationは定義していない。

## 2.1.3.3.1.6. その他、参考文献、リンク等