# 2.1.3.1.1. JP Core Observation（検体検査結果）プロファイル


## 2.1.3.1.1.1. 概略


| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_LabResult |
| バージョン     | 1.0.0                                                      |
| 名前           | JPObservationLabResult                                   |
| タイトル       | JP Core Observation Lab Result Profile |
| ステータス     | アクティブ（2021-11-03）                                   |
| 定義           | このプロファイルは[`Observation`](Observation#Common2)リソースに対して、\[検体検査結果\]のデータを送受信するための制約と拡張を定めたものであり、Observation（共通）プロファイルと共に使用される。　　　　　|
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpobservationlabresult |



本プロファイル説明は、患者に関連付けられた検体検査結果を記録、検索、および取得のために、FHIR `Observation`リソースを使用するにあたっての、最低限の制約を記述したものである。

`Observation`リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

なお、検査結果は、`Observation`リソースを参照する`DiagnosticReport`リソースを使用してグループ化および要約されたものである。各`Observation`リソースは、個々の検体検査と結果値、他の観察結果を参照する。

## 2.1.3.1.1.2. 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。

 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査オーダの依頼科での検体検査情報の参照
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査結果値（範囲、または範囲外）検査オーダの依頼科での検体検査情報の参照
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査結果値（特定のコード）検査オーダの依頼科での検体検査情報の参照
 - `Patient`リソースからの指定された（患者の）検体採取日、検査項目、検査結果値（特定の文字列）検査オーダの依頼科での検体検査情報の参照
 - 検査項目、検査結果値に対し条件に合致する検体検査情報、または関連する他のリソース（`Observation`リソースや、`Patient`リソース等）の参照。

### 2.1.3.1.1.2.1. スコープ

 `Observtion`はヘルスケアの中心的な要素であり、診断の支援、進捗状況の監視、ベースラインやパターンの決定、さらには人口統計学的特性の把握に使用されます。ほとんどの`Observation`は、いくつかのメタデータを持つ単純な名前/値のペアのアサーションであるが、いくつかの`Observation`は、他の `Observation`を論理的にグループ化したり、あるいはマルチコンポーネントの`Observation`であったりする。

このプロファイルでは上記想定シナリオにて用いられる`Observation`の用途がスコープであり、患者基本情報の中でも特に検体検査に該当する情報項目の１つを取り扱う際に、必要な要件を定義している。

### 2.1.3.1.1.2.2. 関連するプロファイル

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
- [`Observation`](ObservationLabResult)
- [`Procedure`](Procedure)
- [`QuestionnaireResponse`](https://www.hl7.org/fhir/questionnaireresponse.html)
- [`RequestGroup`](https://www.hl7.org/fhir/requestgroup.html)
- [`RiskAssessment`](https://www.hl7.org/fhir/riskassessment.html)
- [`ServiceRequest`](https://www.hl7.org/fhir/servicerequest.html)
- [`SupplyRequest`](https://www.hl7.org/fhir/supplyrequest.html)



## 2.1.3.1.1.3. リソース定義
- [リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpobservationlabresult)
- [リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpobservationlabresult/$download?format=json)

 {{tree:jp-core-draftv1/jpobservationlabresult,snapshot}}


### 2.1.3.1.1.3.1. 必須要素 

次のデータ項目はデータが存在しなければならない（必須）であるか、あるいは、データが送信システムに存在する場合はサポートされなければならない（Must Support）要素である。

#### 2.1.3.1.1.3.1.1. 必須
本プロファイルでは、次の要素を持たなければならない。

 - `status`︓検体検査情報項目の状態は必須である。
 - `category`︓このリソースが示す検体検査情報項目を分類するための区分であり、このプロファイルでは必須とする。
 - `code`︓このリソースは何の検体検査情報項目であるかを示すため必須である。
 - `subject`︓このリソースが示す検体検査情報項目が、どの患者のものかを示すため、このプロファイルでは参照する`patient`リソースの定義を必須とする。
 - `effective[x]`：このリソースが示す検体検査情報項目が、いつ発生したかを示すためこのプロファイルでは必須とする。検体採取日時。
 - `specimen`：このリソースが示す検体検査情報項目が、どの検体で検査されるのかを示すため、このプロファイルでは参照する`specimen`リソースの定義を必須とする。

#### 2.1.3.1.1.3.1.2. MustSupport
本プロファイルでは、次の要素はMustSupportである。

 - `value[x]`：このリソースが示す検体検査情報項目の結果である。

### 2.1.3.1.1.3.2. Extensions定義

このプロファイルでは拡張定義は行っていない。

### 2.1.3.1.1.3.3. 用語定義
| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `Observation.category` | 「laboratoy」固定 | Preferred | [`ObservationCategoryCodes`](https://hl7.org/fhir/valueset-observation-category.html) |
| `Observation.code` | JLAC10 | Preferred | `LabResultCode` |

### 2.1.3.1.1.3.4. 制約一覧

<!-- <span style="color:red;">レベルの指定が必要。</span>> 
-->

| id |レベル| 位置 | 説明 |式|
|  ---  |  ---  |  ---  |  ---  |  ---  |
| jp-core-1 | Warning | `Observation.effective[x]` | 一日を含む細かな検体採取日時を必要がある。（年月のみでは不足） | `Observation.effectiveDateTime.exists() implies Observation.effectiveDateTime.toString().length() >= 8` |
| jp-core-2 | Warning | `Observation` | `component` または、`hasMember` が存在しない場合、`value`が存在する必要がある。 | `component.empty() and hasMember.empty()) implies  value.exists()` |
| obs-3 | Guideline | `Observation.referenceRange` | 可能な限り`low`、`high`に構造化すべき。構造化できない場合、あるいは`low`、`high`に該当しない場合は`text`を使用 | `low.exists() or high.exists() or text.exists()` |


## 2.1.3.1.1.4. 利用方法

### 2.1.3.1.1.4.1. インタラクション一覧

`Observation`リソースのインタラクション一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#インタラクション一覧](Observation#ObsInteraction)

### 2.1.3.1.1.4.2. OperationおよびSearch Parameter 一覧

#### 2.1.3.1.1.4.2.1. Search Parameter一覧

検体検査結果ユースケースのSearch Parameter一覧は共通情報プロファイルとは異なり以下の通りである。

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD | `subject`,`code`,`date`,`based-on` | `reference`,`token`,`date`,`reference`  | `GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&based-on=ServiceRequest/456` |
| SHOULD | `subject`,`code`,`date`,`value-quantity`,`based-on` | `reference`,`token`,`date`,`quantity`,`reference`  | `GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&value-quantity=gt40&based-on=ServiceRequest/456` |
| SHOULD | `subject`,`code`,`date`,`value-concept`,`based-on` | `reference`,`token`,`date`,`code`,`reference`  | `GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&value-concept=http://snomed.info/sct|1082004&based-on=ServiceRequest/456` |
| SHOULD | `subject`,`code`,`date`,`value-string`,`based-on` | `reference`,`token`,`date`,`string`,`reference`  | `GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&value-string=positive&based-on=ServiceRequest/456` |
| SHOULD | `code`,`value-quantity`,`subject` | `token`,`quantity`,`reference`  | `GET [base]/Observation?code=http://loinc.org|8867-4&value-quantity=gt40&subject=Patient/123` |
| SHOULD | `code`,`value-concept`,`subject` | `token`,`code`,`reference` | `GET [base]/Observation?code=http://loinc.org|8867-4&value-concept=http://snomed.info/sct|1082004&subject=Patient/123` |
| SHOULD | `code`,`value-string`,`subject` | `token`,`string`,`reference`  | `GET [base]/Observation?code=http://loinc.org|8867-4&value-string=positive&subject=Patient/123` |


#### 2.1.3.1.1.4.2.2. 操作詳細

##### 2.1.3.1.1.4.2.2.1. 必須検索パラメータ

このプロファイルでは必須（SHALL）としての検索項目は定義していない。

##### 2.1.3.1.1.4.2.2.2. 推奨検索パラメータ

次の検索パラメータはサポートすることが推奨される。（SHOULD）

1. 臨床での検索：subject = Patient（対象患者）、検体採取日、検査項目、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。（SHOULD）


`subject`,`code`,`date`,`based-on` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?subject={reference}&code={code}}&date={date}}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&based-on=ServiceRequest/456
   ```

2. 臨床（NST）での検索：`subject = Patient`（対象患者）、検査項目、検査値（数値、条件：基準値から外れている、等）、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。(SHOULD)

`subject`,`code`,`date`,`value-quantity`,`based-on` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?subject={reference}&code={code}}&date={date}}&value-quantity={quantity}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&code=http://loinc.org\|8867-4&date=le2020-12-31&value-quantity=gt40&based-on=ServiceRequest/456
   ```

3. 臨床（NST）での検索：`subject = Patient`（対象患者）、検査項目、検査値（コード）、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。(SHOULD)

`subject`,`code`,`date`,`value-concept`,`based-on` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?subject={reference}&code={code}}&date={date}}&value-concept={code}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&value-concept=http://snomed.info/sct|1082004&based-on=ServiceRequest/456
   ```


4. 臨床（NST）での検索：subject = Patient（対象患者）、検査項目、検査値（文字列）、`basedOn = ServiceRequest`（検査オーダの依頼科）を指定した検索をサポートすることが望ましい。(SHOULD)

`subject`,`code`,`date`,`value-string`,`based-on` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?subject={reference}&code={code}}&date={date}}&value-string={string}&based-on={reference}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&code=http://loinc.org|8867-4&date=le2020-12-31&value-string=positive&based-on=ServiceRequest/456
   ```

5. 研究での検索：検査項目、検査値（数値、条件：ある値以上／以下、等）、`subject = Patient`（対象患者で絞る場合あり）を指定した検索をサポートすることが望ましい。(SHOULD)

`code`,`value-quantity`,`subject` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?code={code}}&value-quantity={quantity}&subject={reference}&
   ```

   例：

   ```
   GET [base]/Observation?code=http://loinc.org|8867-4&value-quantity=gt40&subject=Patient/123
   ```

6. 研究での検索：検査項目、検査値（コード）、`subject = Patient`（対象患者で絞る場合あり）を指定した検索をサポートすることが望ましい。(SHOULD)

`code`,`value-concept`,`subject` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?code={code}}&value-concept={code}&subject={reference}
   ```

   例：

   ```
   GET [base]/Observation?code=http://loinc.org|8867-4&value-concept=http://snomed.info/sct|1082004&subject=Patient/123
   ```

5. 研究での検索：検査項目、検査値（文字列）、`subject = Patient`（対象患者で絞る場合あり）を指定した検索をサポートすることが望ましい。(SHOULD)

`code`,`value-string`,`subject` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?code={code}}&value-string={string}&subject={reference}
   ```

   例：

   ```
   GET [base]/Observation?code=http://loinc.org|8867-4&value-string=positive&subject=Patient/123
   ```



##### 2.1.3.1.1.4.2.2.3. オプション検索パラメータ

<!--
オプションとして次の検索パラメータをサポートすることができる。(MAY)
-->
このプロファイルでは、オプション検索パラメータ(MAY)は定義していない。


#### 2.1.3.1.1.4.2.3. Operation一覧

`Observation`リソースのOperation一覧の定義はユースケースに依存せず共通であるため、共通情報プロファイルに記載されている。

[Observation共通情報プロファイル#Operation一覧](Observation#ObsOperation)


<!--
#### 2.1.3.1.1.4.2.4. サンプル
-->