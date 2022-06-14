# 2.1.3.1.0. JP Core Observation (共通) プロファイル

## 2.1.3.1.0.1. 概要

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_Common |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreObservationCommonProfile |
| タイトル       | JP Core Observation Common Profile |
| ステータス     | アクティブ（2021-11-03）                                   |
| 定義           | このプロファイルは`Observation`リソースに対して、データを送受信するための共通の制約と拡張を定めたものである。 |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpobservationcommon

## 2.1.3.1.0.2. 背景および想定シナリオ
`Observation`リソースに対する主な用途は以下の通り。
- 体重、血圧、体温などのバイタルサイン
- 血糖値や推定GFRなどの検体検査結果
- 骨密度や胎児測定値などの画像検査結果
- 腹部圧痛などの臨床所見（※）
- 目の色など、個人的な特徴
- 喫煙歴、社会歴、家族支援、認知状態など

※ 臨床所見と疾患の境界は、医療オントロジーの課題となる。一般的なガイドについては、[`Observation`リソースの境界](https://www.hl7.org/fhir/observation.html#bnr)および[`Condition`リソースの境界](https://www.hl7.org/fhir/condition.html#bnr)のセクションを参照のこと。

### 2.1.3.1.0.2.1. スコープ
`Observation`（検査、観察）はヘルスケアの中心的な要素であり、診断の補助、進行状況のモニタリング、基準とパターンの決定、人口統計的特性の把握に使用される。ほとんどの`Observation`は、メタデータを含む単純な名前/値のペアとなる。一部の`Observation`は、他の`Observation`を論理的にグループ化したり、複数の要素から構成される場合もある。

`DiagnosticReport`（検査レポート）リソースは一連の検査の臨床/ワークフローの文脈を定義する。`Observation`リソースは`DiagnosticReport`から参照されることで、検査、画像、その他の臨床および診断データから表現されるレポートを形作る。

## 2.1.3.1.0.3. 関連するプロファイル
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
- [`Observation`](Observation)
- [`Procedure`](Procedure)
- [`QuestionnaireResponse`](https://www.hl7.org/fhir/questionnaireresponse.html)
- [`RequestGroup`](https://www.hl7.org/fhir/requestgroup.html)
- [`RiskAssessment`](https://www.hl7.org/fhir/riskassessment.html)
- [`ServiceRequest`](https://www.hl7.org/fhir/servicerequest.html)
- [`SupplyRequest`](https://www.hl7.org/fhir/supplyrequest.html)



## 2.1.3.1.0.4. プロファイル定義
- [プロファイル定義ページの参照](https://simplifier.net/jp-core-draftv1/jpobservationcommon/)
- [プロファイル定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpobservationcommon//$download?format=json)

 {{tree:jp-core-draftv1/jpobservationcommon}}

### 2.1.3.1.0.4.1. 必須要素  <a name="ObsRequired">link</a>

次のデータ項目はデータが存在しなければならない（必須）、あるいは、データが送信システムに存在する場合はサポートされなければならない（Must Support）要素である。

#### 2.1.3.1.0.4.1.1. 必須
このプロファイルでは、次の要素を持たなければならない。

- `status`︓検査項目情報の状態は必須である。
- `code`︓このプロファイルは何の検査項目であるかを示すため必須である。

#### 2.1.3.1.0.4.1.2. MustSupport
このプロファイルではMust Supportの要素は存在しない。

### 2.1.3.1.0.4.2. Extension定義
このプロファイルでは拡張定義は行っていない。

### 2.1.3.1.0.4.3. 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `Observation.status` | 検査の状態を提供するコード | Required（必須） | [ObservationStatus](https://www.hl7.org/fhir/valueset-observation-status.html) |
| `Observation.category` | 上位レベルの検査カテゴリのコード | Example（例） | [ObservationCategoryCodes](https://www.hl7.org/fhir/valueset-observation-category.html) |
| `Observation.code`<br>`Observation.component.code` | 単一の検査名を特定するコード | Example（例） | [LOINCCodes](https://www.hl7.org/fhir/valueset-observation-codes.html) |
| `Observation.dataAbsentReason` <br> `Observation.component.dataAbsentReason` | 結果(`Observation.value[x]`)の欠損理由を特定するコード | Extensible（拡張可能） | [DataAbsentReason](https://www.hl7.org/fhir/valueset-data-absent-reason.html) |
| `Observation.interpretation` <br> `Observation.component.interpretation` | 検査の解釈を特定するコード | Extensible（拡張可能） | [ObservationInterpretationCodes](https://www.hl7.org/fhir/valueset-observation-interpretation.html) |
| `Observation.bodySite` | 解剖学的位置を表現するコード。ラテラリティ（左右）も含む場合あり。 | Example（例） | [SNOMEDCTBodyStructures](https://www.hl7.org/fhir/valueset-body-site.html) |
| `Observation.method` | 単一の検査の測定方法 | Example（例） | [ObservationMethods](https://www.hl7.org/fhir/valueset-observation-methods.html) |
| `Observation.referenceRange.type` | 基準値の種別コード | Preferred（優先） | [ObservationReferenceRangeMeaningCodes](https://www.hl7.org/fhir/valueset-referencerange-meaning.html) |
| `Observation.referenceRange.appliesTo` | 基準値が適用される母集団を識別するコード | Example（例） | [ObservationReferenceRangeAppliesToCodes](https://www.hl7.org/fhir/valueset-referencerange-appliesto.html) |


### 2.1.3.1.0.4.4. 制約一覧
| id |レベル| 位置 | 説明 |式|
|  ---  |  ---  |  ---  |  ---  |  ---  |
| obs-3 | Rule | `Observation.referenceRange` | 少なくとも上限・下限もしくはテキストが必要。 | `low.exists()`<br/>or<br/>`high.exists()`<br/>or<br/>`text.exists()` |
| obs-6 | Rule | (base) | `Observation.value[x]` が存在しない場合にのみ `dataAbsentReason` が存在するようする必要がある。(SHALL) | `dataAbsentReason.empty()`<br/>or<br/>`value.empty()` |
| obs-7 | Rule | (base) | `Observation.code` が `Observation.component.code` と同一だった場合、コードに関連付けられた`value`要素は存在してはいけない。(SHALL NOT) | `value.empty()`<br/>or<br/>`component.code.where(coding.intersect(%resource.code.coding).exists()).empty()` |



## 2.1.3.1.0.5. 利用方法

### 2.1.3.1.0.5.1. インタラクション一覧 <a name="ObsInteraction">link</a>

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

### 2.1.3.1.0.5.2. OperationおよびSearch Parameter 一覧

#### 2.1.3.1.0.5.2.1. Search Parameter一覧　<a name="ObsSearch">link</a>

ユースケース独自のSearch Parameterが定義されていない場合、以下の表の内容の共通のSearch Parameterとなる。ただし、`category`パラメータおよび`code`パラメータについては、各ユースケース毎に異なる固定値および用語定義で定められたコード体系を指定することになるので注意が必要である。


| コンフォーマンス | パラメータ | 型 | 例 |
| --- | --- | --- | --- |
| MAY | `subject`,`category`,`code`,`value-quantity` | `reference`,`token`,`token`,`quantity`  | `GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40` |
| MAY | `subject`,`category`,`code`,`value-quantity`,`date` | `reference`,`token`,`token`,`quantity`,`date`  | `GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40&date=le2020-12-31` |
| MAY | `subject`,`category`,`code`,`value-quantity`,`encounter` | `reference`,`token`,`token`,`quantity`,`encounter`  | `GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40&encounter=Encounter/456` |


#### 2.1.3.1.0.5.2.2. 操作詳細

##### 2.1.3.1.0.5.2.2.1. 必須検索パラメータ

<!--
次の検索パラメータは必須でサポートされなければならない。（SHALL）
-->
このプロファイルでは検索の多様性が求められるため、必須（SHALL）とする検索項目は定義していない。

##### 2.1.3.1.0.5.2.2.2. 推奨検索パラメータ

<!--
次の検索パラメータはサポートすることが推奨される。（SHOULD）
-->
このプロファイルでは検索の多様性が求められるため、推奨（SHOULD）とする検索項目は定義していない。

##### 2.1.3.1.0.5.2.2.3. オプション検索パラメータ

オプションとして次の検索パラメータをサポートすることができる。(MAY)

1.患者中心での検索：`subjet`（= `Patient`リソース：対象患者）、`category`（対象カテゴリ）、`code`（対象項目）、`value[x].valueQuantity`（値条件）での検索をサポートすることが望ましい。（MAY）

検査結果値であるエレメント=`value[x].valueQuantity`の実際のSearch Parameterは`value-quantity`となる。

`subject`,`category`,`code`,`value-quantity` の各検索パラメータに一致する`Observation`リソースを含むBundleを取得することができる。

   ```
   GET [base]/Observation?subject={reference}&category={token}&code={token}&value-quantity={quantity}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40
   ```


2.項目中心の検索：`subjet`（= 複数の`Patient`リソース：母集団としての患者範囲）、`category`（対象カテゴリ）、`code`（対象項目）、`value[x].valueQuantity`（値条件）、`effective[x].effectiveDateTime` または `.effectivePeriod`（期間範囲）での検索をサポートすることが望ましい。（MAY）

検査結果値であるエレメント=`value[x].valueQuantity`の実際のSearch Parameterは`value-quantity`となり、期間指定についてはエレメントが`effective[x].effectiveDateTime` または `.effectivePeriod` いずれの場合においてもSearch Parameterは`date`となる。

`subject`,`category`,`code`,`value-quantity`,`date` の各検索パラメータに一致する`Observation`リソースを含むBundleを検索する。


   ```
   GET [base]/Observation?subject={reference}&category={token}&code={token}&value-quantity={quantity}&date={date}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40&date=le2020-12-31
   ```



3.訪問診療等の検索：`subjet`（= 複数の`Patient`リソース：母集団としての患者範囲）、`category`（対象カテゴリ）、`code`（対象項目）、`value[x].valueQuantity`（値条件）、`encounter`（= `Encounter`リソース：対象医療行為）での検索をサポートすることが望ましい。（MAY）

`subject`,`category`,`code`,`value-quantity`,`date`,`encountr` の各検索パラメータに一致する`Observation`リソースを含むBundleを検索する。

   ```
   GET [base]/Observation?subject={reference}&category={token}&code={token}&value-quantity={quantity}&date={date}&&encounter={encounter}
   ```

   例：

   ```
   GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40&date=le2020-12-31&encounter=Encounter/456
   ```


#### 2.1.3.1.0.5.2.3. Operation一覧 <a name="ObsOperation">link</a>

| コンフォーマンス | オペレーション    | 説明                                                           |
| ---------------- | ------------- | ------------------------------------------------------------ |
| MAY | `$lastn` | `$lastn`オペレーションを使用すると、指定したある条件を満たす、最新のn件の`Observation`リソースを取得することができる。 |

##### 2.1.3.1.0.5.2.3.1. オプションオペレーション

オプションとして次のオペレーションをサポートすることができる。(MAY)

1. `Observation`用 `$lastn` オペレーション

`$lastn` オペレーションはある条件に基づく最新、または最新からn件の検査結果/測定結果等を取得するという一般的なニーズを満たすためのオペレーションである。例えば、直近の傾向を見るために、患者の過去5回分の体温を取得したり、最新の検査結果や媒体るサインを取得したりすることができる。
検索を行う際は、通常の`Observation`の検索パラメータと組み合わせて使用される。また、対象となる患者等を限定するための、`patient`または`subject`の検索パラメータ、およびカテゴリを指定する`category`検索パラメータは必須の検索パラメータとなる。

また取得される結果には以下のルールに従う。
- 追加パラメータによりフィルタされる
- 取得される結果は`Observation.code`の値によるグルーピング処理(Group by)される
- 新しいデータから古いデータの順にソートされる
- グループごとにmaxパラメータに指定された数だけ応答が返る。maxが指定されない場合は、最新の結果のみが返される。



この操作の公式なURLは以下である。  
http://hl7.org/fhir/OperationDefinition/Observation-lastn



###### 2.1.3.1.0.5.2.3.1.1. 入力パラメータ

| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| max  | 0..1   | positiveInt    |                |              | max は、lastn クエリ操作のオプションの入力パラメータ。これは、各グループから返す`Observation`の最大数を指定するために使用される。例えば、「ある患者のすべてのバイタルサイン結果から最新の3件を取得する」というクエリの場合、max = 3となる。 |



###### 2.1.3.1.0.5.2.3.1.2. 出力パラメータ

| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |


#### 2.1.3.1.0.5.2.4. サンプル

リクエスト：ある患者のすべてのバイタルから最新の3件を取得する。

```
GET [base]/Observation/$lastn?max=3&patient=Patient/123&category=vital-signs
```

レスポンス：各サーバ毎に実装されたLast Nアルゴリズムに従い、患者のすべてのバイタルの中からコードごとに分類し、それぞれについて最新の3件を返す。以下の応答例では、9種のバイタルに対してそれぞれ3件ずつ応答を返しているため、合計27件の`Observation`のバンドルとなっている。

```json

HTTP/1.1 200 OK
[other headers]

{
  "resourceType": "Bundle",
  "id": "26419249-18b3-45de-b10e-dca0b2e72b",
  "meta": {
    "lastUpdated": "2017-02-18T03:28:49Z"
  },
  "type": "searchset",
  "total": 27,
  // the patient temperature was being taken several times a day
  "entry": [{
    "fullUrl": "http://server/path/Observation/20170219-06temp",
    "resource": {
      "resourceType": "Observation",
      "id": "20170219temp",
      .. 中略 ...
  ,{
   "fullUrl": "http://server/path/Observation/20170219-05temp",
       "resource": {
         "resourceType": "Observation",
         "id": "20170218temp",
      .. 中略 ...
    }
      .. 中略 ...
  ]
}
```

## 2.1.3.1.0.6. 補足説明
本セクションは`Observation`リソースを理解する上で重要となる[Observation基底仕様の「Note」セクション](https://www.hl7.org/fhir/observation.html#notes)を抜粋＆翻訳し、転記したものである。なお、本セクションではobservationを"検査"と和訳している点に留意されたい（ただし、リソース名を明確に指す場合のみ`Observation`と表記している）。

### 2.1.3.1.0.6.1. 検査のプロファイリング
最も単純な場合、リソースインスタンスはコード、値、および状態フラグだけで構成できる。他のプロパティの関連性は、検査の種類によって異なる。プロファイルは、与えられた事例に対する特定の種類の検査を記録する際の指針を提供するために作成される。`Observation`リソースは、大多数のシステムで記録された詳細さの度合いに焦点を当てている。ただし、特定の事例では、特定の状況に関連する追加の制約と追加の情​​報がある場合がある。こうした複雑さを追加で取り込めるように、他のリソースと同様、拡張機能が利用できる。

### 2.1.3.1.0.6.2. 検査の対象
通常、対象（患者もしくは患者グループ、場所、もしくは機器）に対して検査が行われ、その検査のために直接計測されたものと対象との間の区別は、検査コード（例えば、血糖）によって特定され、別々に表現する必要はない。ただし、対象そのものでない場合、検査の焦点を表現するために3つの属性を使用できる。`specimen`（検体）および`bodySite`（検査対応部位）の要素は、対象のサンプルもしくは解剖学的・形態学的な位置の測定値の表現に利用され、患者に埋め込まれた機器や別の検査などの注意点に相当するような対象の特定の観点に焦点を当てて表現している。

### 2.1.3.1.0.6.3. 検査のグループ分け
多くの検査は、他の検査と重要な関係性を持っているため、グループ化する必要がある。 

- 例えば、構造は以下のように定義される：  
検査レポートと`DiagnosticReport.result`（検査レポート結果）

- 検査の要素については以下のように定義される：  
`Observation.component`（検査コンポーネント）、 `Observation.hasMember`（検査保持メンバ）、`Observation.derivedFrom`（検査派生元）

以下の節では、使用される構造に関しての指針について述べる。何をグループ化するのかという考え方は、しばしば文脈に高く依存しており、エンドユーザーの視点にも基づくため、使用する構造の選択は、権限や組織的な訓練、文脈などによって決めるべきである。通常、プロファイリングは実装に必要になるだろう。

#### 2.1.3.1.0.6.3.1. DiagnosticReport.result（検査レポート結果）
検査レポートはオーダ（サービス要求）に直接関連している。`DiagnosticReport.code`（検査レポートコード）はパネルに名前を付け、グループ化要素として機能する。従来、これは臨床検査において"パネル"や"バッテリー"と呼ばれていたものである。`DiagnosticReport.result`（検査レポート結果）の要素は、個々の検査を参照する。いくつかの例では、検査レポートを使った検査のグループ化をグループ化の構造として示している。

#### 2.1.3.1.0.6.3.2. Observation.component（検査コンポーネント）
`Observation.component`（検査コンポーネント）は、構成する`Observation`リソースの範囲を超えて、合理的には解釈できないような結果をサポートするために使われる。検査コンポーネントは、個別かつ分けられた検査の一部分から構成されるか、`Observation.code`に対して適切な情報を提供する。また、`Observation.code`に関して唯一、解釈を与えるものとなる（例えば、`$stats`操作を参照）。従って、正しく検査の意味を理解するためには、**すべて**の `code`-`value`（コード・値） と `component.code`-`component.value`（要素コード・要素値） のペアを考慮する必要がある。コンポーネントは、一つの手法、一つの検査、一人の検査実施者、一つの装置、および1回しかない場合のみ使用するべきである。この構造を使用するユースケースには次のようなものがある。：

- 1.一般的に生成され、一緒に解釈される検査。たとえば、収縮期および拡張期の血圧は、単一の血圧パネルとして表現。
- 2.一般的に一緒に生成および解釈される評価ツールの結果。たとえば、5つの要素を持つ単一の検査である新生児のアプガー指数。
- 3.質問に対する複数の回答の表現（検査と質問/回答の関係と境界）。たとえば、患者が飲んだアルコールの種類の報告。

一方で、別の検査の構成要素であるという文脈から外れた臨床的に関連する検査は、個別の`Observation`リソースで表されるべきである。例えば、ボディマス指数（BMI）検査は、身長と体重は臨床的に関連した検査であるから、これらを要素に含むべきではない。個別の`Observation`リソースとして表現するべきである。どのように独立した検査を関連付けるか、後述するセクションを参照のこと。

#### 2.1.3.1.0.6.3.3. Observation.hasMember（検査保持メンバ） および Observation.derivedFrom（検査派生元）
`Observation.hasMember`（検査保持メンバ）と `Observation.derivedFrom`（検査派生元）、および中核となる拡張機能である`Observation`-`sequelTo`（検査・続編） と `Observation`-`replaces`（検査・置換）は、手法、検査、実施者、機器、時間、エラー状態に対して1つ以上の異なる値を持った結果や、それ自体の使用や解釈した結果をサポートするために利用される。この構造を用いる2つの共通事例は以下の通り:

- 1."パネル"や"バッテリー"などに対する検査に関連したグループ分けについて。この事例では、`Observation.code`（検査コード）は、"パネル"コードを表す。典型的には、`Observation.value[x]`（検査値）は存在せず、検査メンバのセットが`Observation.hasMember`（検査保持メンバ）に一覧される。この構造は、検査レポート（例えば、複雑なマイクロ分離と感受性検査報告）と共に利用される場合には、入れ子になったグループ分けを許可する。
- 2.ある検査が派生して他の検査と関連付ける場合、`Observation.code`（検査コード） と `Observation.value[x]`（検査値）の両方とも存在し、関連付けられた検査は`Observation.derivedFrom`（検査派生元）に一覧される。この一例として、身長と体重の計測値が参照されるボディマス指数（BMI）検査がある。

### 2.1.3.1.0.6.4. 検査におけるコード利用
結果の値をコードを用いて事前定義された概念で表現するとき、`valueCodeableConcept`が使われる。この要素は、SNOMED CTなどの標準的な命名法または元システム（"ローカル"）でコード化された結果値で構成される値セットにバインドされる。

#### 2.1.3.1.0.6.4.1. 多重コーディング
結果は、異なるコードシステムに基づいて複数の値セットでコーディングでき、概念マップリソースを使用してマッピングしたり、下の例に示すように要素に直接追加のコーディングとして指定したりできる。 例えば、[LOINC 43304-5（*プローブおよびターゲット増幅法による不特定検体中のクラミジア･トラコマチスrRNA [Presence] *）](https://loinc.org/43304-5/)は、典型的にコード化された presence もしくは absence の概念と関連付けられる。 標準コード変換を用いて "陰性" をコード化した値を利用して、`valueCodeableConcept`は以下のように表現される：

```json
 "valueCodeableConcept": {
  "coding": [
   {
    "system": "http://snomed.info/sct",
    "code": "260385009",
    "display": "陰性"
   }, {
    "system": "https://acme.lab/resultcodes",
    "code": "NEG",
    "display": "陰性"
   }
  ],
  "text": "クラミジア・トラコマチスrRNA 陰性"
 }
```

#### 2.1.3.1.0.6.4.2. コーディング結果のためのテキスト値:
データ要素が通常通りコード化される時や、`code`（コード）要素と関連付けられた型がコードの値を定義する際、適切なコードがなく、フリーテキストのみが利用できる場合であっても`valueCodeableConcept`を使用する。例えば、テキストだけ使うと、`valueCodeableConcept` 要素は以下のようになる：

```json
 "valueCodeableConcept": {
  "text": "コード化不可のフリーテキスト結果"
 }
```

コード化された回答リストに"その他"の概念コードが含まれ、概念のフリーテキスト記述がある場合、情報源の完全な意味を取り込むため `valueCodeableConcept.text`要素を使用するべきである。以下の例では、回答コード"その他"は、`valueCodeableConcept`要素の中で提供され、`valueCodeableConcept.text`要素の中で提供される値がテキスト値となる。

```json
{
 "resourceType": "Observation",
 ... 中略 ...
 "code": {
  "coding": [
   {
    "system": "http://loinc.org",
    "code": "74076-1",
    "display": "関与する薬物または物質"
   }
  ]
 },
 ... 中略 ...
 "valueCodeableConcept": {
  "coding": [
   {
    "system": "http://loinc.org",
    "code": " LA20343-2",
    "display": "その他の物質: 特定が必要"
   }
  ],
  "text": "その他: ソファの下で見つけた青い錠剤"
 }
 ... 中略 ...
}
```

#### 2.1.3.1.0.6.4.3. FHIRにおけるコード値の組み合わせを用いた相互運用性の課題
多くの検査イベントに対して（特定パターンかどうかに関わらず）繰り返し発生する課題は、`Observation.code`（検査コード）と`Observation.value`（検査値）を追加する方法を決める時に起こる。このことは臨床検査においてはごく簡単なことだが、所見や疾患、家族歴などのその他の種類の検査にて曖昧性を生じる。この議論は、そのようなステートメントのコード化された表現が `Observation.code`（検査コード）および `Observation.value`（検査値）の要素を使用して表現される方法に焦点を当てている。

FHIRの検査には、中心となる2つの異なる側面がある：
  - プロパティが検査された所見 および/または プロパティを作成するために実行されたアクション。例：血中ヘモグロビンの測定。
  - 検査の結果。例：14 g/dl。

`Observation.code`と`Observation.value`の異なる組み合わせを使用して、同じ情報を表すいくつかの異なる方法が存在する。代替手段の制約のない使用は、意味的等価性の計算と、さまざまなアプリケーションおよびユーザーからの検査に対する安全な解釈が大きな課題である。次の4つのパターンは、同じケースを合理的に表すことができる。 `Observation`リソースは多くのユースケースをサポートする必要があることを考慮すると、特定のパターンを定義する適切な場所は、FHIRを実装する権限 および/または 組織によって指定されたプロファイルおよび実装ガイドを通じて行われることが期待される。:

  - 1.`Observation.code` は、検査の性質を表現しており、`Observation.value` は数値以外の結果値を表している。これらは、FHIR検査の中心となる2つの異なる側面となっている。  
例:
    - `code`=[検査]
    - `value`=[腹部圧痛]
  - 2.`Observation.code` は上記1.とほぼ同じだが、粒度のレベルは値からコードに移行される。    
例:
    - `code`=[腹部検査]
    - `value`=[圧痛]
  - 3.`Observation.code` は、検査アクションを指定しない方法でも表現されるが、上記の項目のように、単一の名前（または用語）にまとめられた検出結果に関するステートメントを示す。 この例では、`Observation.value` が存在し、通常それを確認または否決する結果を「修飾」する。  
例:
    - `code`=[腹部圧痛]
    - `value`=[確認/陽性]
  - 4.この例では `Observation.code` は、検査アクションを指定しない方法で表現されているが、単一の名前（または用語）にまとめられた検出結果に関するステートメントを示している。 この文脈における特定の例では、`Observation.value`は省略されている。  
例：
    - `code`=[腹部圧痛]
    - `value`要素は省略

#### 2.1.3.1.0.6.4.4. ガイダンス:
- 1.ケース1 と ケース2 の推奨ルール:
  - `Observation.code` はLOINC概念コードであることが望ましい。
    - もし SNOMED CT 概念コードを使用する場合、363787002 (*Observable entity (Observable entity)*) か386053000 (*Evaluation procedure(evaluation procedure)*) を表す必要がある（SHOULD）。
  - 数値以外の場合、`Observation.value` はSNOMED CT概念コードであることが望ましい。

- 2.ケース3 の推奨ルール:
  - `Observation.value` はLOINCまたはSNOMED CT概念コードであることが望ましい。
    - もしSNOMED CT 概念コードを使用する場合、404684003 (*Clinical finding (finding)*)、413350009 (*Finding with explicit context(finding)*)、または 272379006 (*Event(event)*) を表す必要がある（SHOULD）。
  - `Observation.value` は以下のどちらかによって表される。
    - `valueBoolean`（論理値）
    - `valueCodeableConcept`はできれば以下を利用:
      - SNOMED CTの362981000 (*Qualifier value (qualifiervalue)*) の下位概念
      - HL7 v2 の Y/N Indicator
      - HL7 v2 の 拡張 Y/N Indicator (*unfortunately is missing 'not given'*)

- 3.ケース4の推奨ルール:
  - `Observation.code` がSNOMED CTの404684003 (*Clinical finding (finding)*)、413350009 (*Finding with explicit context(finding)*) または 272379006 (*Event(event)*)の下位概念。
  - `Observation.value` は省略される。デフォルトの解釈は、`Observation.code`で表される概念（単一コードまたは表現）が患者に存在すること。"clinical-finding"（臨床所見）の `Observation.dataAbsentReason` 値は想定される値が欠損している理由を明記している必要がある（SHOULD）。

- 4.HL7 Version 3 Implementation Guide: TermInfo - Using SNOMED CT in CDA R2 Models, Release 1 で説明されているアサーションパターンは使用してはならない（SHOULD NOT）。

### 2.1.3.1.0.6.5. 追加コードや複数の検査による Observation 解釈の精緻化
次のリストは、コードの使用または他の複数の検査によって、検査の解釈が変更される可能性がある追加文脈を付与するためのガイドである。:

- 1.可能であれば最も専用のコードを使用する。  
例：

```json
{
"resourceType": "Observation",
... 中略 ...
"code": {
 "coding": [
  {
   "system": "http://loinc.org",
   "code": "6689-4",
   "display": "血糖値[質量/体積]--食後2時間値"
  }
 ]
},
... 中略 ...
}
```

- 2.または上記のように`Observation.code` で追加のコードを使用する。  
例: `Observation.code` = *coding-1: 59408-5 パルスオキシメータによる動脈血酸素飽和度, coding-2: 20564-1 血中酸素飽和度*

```json
{
"resourceType": "Observation",
... 中略 ...
"code": {
 "coding": [
  {
   "system": "http://loinc.org",
   "code": "59408-5",
   "display": "パルスオキシメータによる動脈血酸素飽和度"
  },
  {
   "system": "http://loinc.org",
   "code": "20564-1",
   "display": "血中酸素飽和度"
  }
 ]
},
... 中略 ...
}
```

- 3.上記のようにグループ化された複数の検査は、検査を正しく理解・解釈するために必要な追加情報を与える。検査をグループ化する代わりに拡張機能を使用することで、検査の理解・解釈に必要な他の検査の参照先にできる。

（備考：既存の Observation Extensionsを評価するため、実装者コミュニティからの意見を募集中。フィードバックは[こちら](https://chat.fhir.org/#narrow/stream/103-Orders-and.20Observation.20WG)。）

### 2.1.3.1.0.6.6. 値とデータ型
`Observation.value[x]`要素には、次のように型に応じた変数名がある。
  - `valueQuantity`（量）
  - `valueCodeableConcept`（コーダブルコンセプト値）
  - `valueString`（文字列）
  - `valueBoolean`（論理値）
  - `valueInteger`（整数値）
  - `valueRange`（範囲）
  - `valueRatio`（比率）
  - `valueSampledData`（サンプルデータ値）
  - `valueTime`（時刻）
  - `valueDateTime`（日時）
  - `valuePeriod`（期間）

詳細は[結果値のコードの使い方](https://www.hl7.org/fhir/observation.html#usingcodes)を参照のこと。

ほとんどの検査結果値は「不明」などの例外のために完全な論理値にならないため、論理型はめったに使用されない。
従って、代わりにデータ型`CodeableConcept`を使用し、[バリューセット](http://terminology.hl7.org/ValueSet/v2-0136)からコードを選択する必要がある（これら「はい/いいえ」の概念は、表示名「true / false」または必要に応じて他の相互に排他的な用語にマッピング可能）。

データ型`SampledData`には、特別な値「E」（エラー）、「L」（検出限界未満）、「U」（検出限界超え）が使用できる。
しかし、検出限界値超えもしくは未満の範囲の検査でデータ型`valueQuantity`を使用する場合は、比較基準と共に限界値を指定して`valueQuantity`を使用する必要がある。
さらにエラーが発生した場合、`dataAbsentReason`要素に適切な値（「エラー」または「NaN」）を使用する必要がある。
たとえば、値が "2.0 mmol/L 未満" の検出下限を下回った場合、`valueQuantity`は次のようになる:

```json
 "valueQuantity": {
  "value": 2.0,
  "comparator": "<",
  "unit": "mmol/l",
  "system": "http://unitsofmeasure.org",
  "code": "mmol/L"
 }
```

もし値が「NaN」（エラー）の場合、`valueCodeableConcept`要素は存在せず。`dataAbsentReason`要素は次のようになる。

```json
 "dataAbsentReason": {
  "coding": [
   {
    "system": "http://terminology.hl7.org/CodeSystem/data-absent-reason",
    "code": "NaN",
    "display": "数値化不能"
   }
  ]
 }
```

値要素には複数の型が許可されているため、複数の値検索パラメータが定義されている。ただし、`Ratio`型の値を検索するための標準パラメータはない。

### 2.1.3.1.0.6.7. 検査における生理学的に重要な時間
`effectiveDateTime`と`effectivePeriod`は、検査に密接に関連する時間情報である。 生物学的対象（例：人間の患者）の場合、生理学的に検査に関連する時間である。検体の検査の場合、検体収集の開始と終了を表す（24時間尿中ナトリウム等）が、収集時間が十分に短い場合は１点の時刻を指す（例：通常の静脈穿刺）。対象者から直接得た検査の場合（例：血圧、胸部X線）、こちらも多くの場合、検査プロセスの開始時間と終了時間のうち１点の時刻を指す。

### 2.1.3.1.0.6.8. 参照範囲
最も一般的な検査には普遍的な参照範囲が1個だけ含まれる。参照範囲は、臨床検査や他の収縮期血圧のような検査には有用かもしれないが、「妊娠」のようなものにはほとんど関係ない。システムは患者に関する知識（例：患者固有の年齢・性別・体重・その他要因）に基づいて関連する参照範囲のみに制限できる（MAY）が、それは不可能か不適切な場合がある。複数の参照範囲があるときは常に、参照範囲 および/または 年齢属性で違いが分かるようにしなければならない（SHOULD）。

### 2.1.3.1.0.6.9. キャンセルまたは中止された検査
検査や検査を完了できなかった場合（例えば検体が不十分とか、医療者がオーダをキャンセルしたとか）、ステータスをキャンセルに更新し、具体的な詳細を、できればコード化された値として`dataAbsentReason`か`valueCodeableConcept`要素に設定する。`note`要素にも同様に追加情報が付与される場合がある。[検体拒否の例](https://www.hl7.org/fhir/observation-example-unsat.html)は、"不十分な検体"という意味のコード値を`dataAbsentReason`へ設定している。

### 2.1.3.1.0.6.10. 遺伝情報についての検査
遺伝情報の報告には、`DiagnosticReport`リソースと`Observation`リソースを主に使用する。遺伝情報に関する結果の記述についての実装ガイドは[こちら](http://hl7.org/fhir/uv/genomics-reporting/index.html)を参照されたい。