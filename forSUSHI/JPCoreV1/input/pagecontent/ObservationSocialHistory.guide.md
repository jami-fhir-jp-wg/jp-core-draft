# 2.1.3.1.5. Observation 生活背景情報用プロファイル

## 2.1.3.1.5.1. 概要
| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Observation_SocialHistory |
| バージョン     | 1.0.0                                                      |
| 名前           | JP_Observation_SocialHistory                                   |
| タイトル       | JP Core Observation Social History Profile |
| ステータス     | アクティブ（2021-11-03）                                   |
| 定義           | Observation Social History Profile |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpobservationsocialhistory |

本プロファイル説明は、患者に付属する一項目分のバイタルサイン情報について、情報の登録や検索、取得のために、`JP_Observation_SocialHistory`リソースを使用するにあたっての、最低限の制約を記述したものである。
`JP_Observation_SocialHistory` リソースに対して本プロファイルに準拠する場合に必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。


## 2.1.3.1.5.2. 背景および想定シナリオ

本プロファイルは、以下のようなユースケースを想定している。
- `Patient`リソースから指定された日時、期間での患者生活背景情報の参照
- `Patient`リソースから指定された患者生活背景情報項目に対する、指定された期間での患者生活背景情報の参照
- 指定された期間や患者生活背景情報項目に対し、条件に合致する患者生活背景情報、または関連する他のリソース（`Observation`リソースや、`Patient`リソース等）の参照。


### 2.1.3.1.5.2.1. スコープ

`Observtion`はヘルスケアの中心的な要素であり、診断の支援、進捗状況の監視、ベースラインやパターンの決定、さらには人口統計学的特性の把握に使用されます。ほとんどの`Observation`は、いくつかのメタデータを持つ単純な名前/値のペアのアサーションであるが、いくつかの `Observation`は、他の`Observation`を論理的にグループ化したり、あるいはマルチコンポーネントの`Observation`であったりする。

このプロファイルでは上記想定シナリオにて用いられる`Observation`の用途がスコープであり、患者基本情報の中でも特に患者バイタルサインに該当する情報項目の１つを取り扱う際に、必要な要件を定義している。


## 2.1.3.1.5.3. 関連するプロファイル
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
- [`DiagnosticReport`](/DiagnosticReport)
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
- [`Observation`](ObservationSocialHistory)
- [`Procedure`](Procedure)
- [`QuestionnaireResponse`](https://www.hl7.org/fhir/questionnaireresponse.html)
- [`RequestGroup`](https://www.hl7.org/fhir/requestgroup.html)
- [`RiskAssessment`](https://www.hl7.org/fhir/riskassessment.html)
- [`ServiceRequest`](https://www.hl7.org/fhir/servicerequest.html)
- [`SupplyRequest`](https://www.hl7.org/fhir/supplyrequest.html)




## 2.1.3.1.5.4. リソース定義
- [リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpobservationsocialhistory)
- [リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpobservationsocialhistory/$download?format=json)

 {{tree:jp-core-draftv1/jpobservationsocialhistory,snapshot}}

### 2.1.3.1.5.4.1. 必須要素

次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する（Must Support）。

#### 2.1.3.1.5.4.1.1. 必須
本プロファイルでは、次の要素を持たなければならない。

- `status`︓生活背景情報項目の状態は必須である。
- `category`︓このリソースが示す生活背景情報項目を分類するための区分であり、このプロファイルでは必須とする。
- `code`︓このリソースは何の生活背景情報項目であるかを示すため必須である。
- `subject`︓このリソースが示す生活背景情報項目が、どの患者のものかを示すため、このプロファイルでは参照する`patient`リソースの定義を必須とする。

#### 2.1.3.1.5.4.1.2. Must Support
このプロファイルでは MustSupport要素定義は行っていない。

### 2.1.3.1.5.4.2. Extension定義
このプロファイルでは拡張定義は行っていない。

### 2.1.3.1.5.4.3. 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| `JP_Observation_SocialHistory.category` | 基底仕様のカテゴリ「social-history」固定とする | Preferred | [`ObservationCategoryCodes`](https://hl7.org/fhir/valueset-observation-category.html) |
| `JP_Observation_SocialHistory.code` | MEDIS-DCによるJ-MIX（電子保存された診療録情報の交換のためのデータ項目セット）第6章を元に定義する | Preferred | `SocialHistoryCode` |

### 2.1.3.1.5.4.4. 制約一覧

このプロファイルでは制約定義は行っていない。

## 2.1.3.1.5.5. 利用方法

### 2.1.3.1.5.5.1. インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

### 2.1.3.1.5.5.2. OperationおよびSearch Parameter 一覧

#### 2.1.3.1.5.5.2.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHOULD | `subject`,`category`,`code`,`value-quantity` | `reference`,`token`,`token`,`quantity`  | `GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40` |
| SHOULD | `subject`,`category`,`code`,`value-quantity`,`date` | `reference`,`token`,`token`,`quantity`,`date`  | `GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40&date=le2020-12-31` |
| SHOULD | `subject`,`category`,`code`,`value-quantity`,`encounter` | `reference`,`token`,`token`,`quantity`,`encounter` | `GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40&encounter=Encounter/456` |

#### 2.1.3.1.5.5.2.2. 操作詳細

##### 2.1.3.1.5.5.2.2.1. 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。（SHALL）

（`Observation`リソースでは検索の多様性が求められるため、必須としての検索項目は定義していない。）

##### 2.1.3.1.5.5.2.2.2. 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。（SHOULD）

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

2.項目中心の検索：`subject`（= 複数のPatientリソース：母集団としての患者範囲）、`category`（対象カテゴリ）、`code`（対象項目）、`value[x].valueQuantity`（値条件）、`effective[x].effectiveDateTime` または .`effectivePeriod`（期間範囲）での検索をサポートすることが望ましい。（MAY）

検査結果値であるエレメント=`value[x].valueQuantity`の実際のSearch Parameterは`value-quantity`となり、期間指定についてはエレメントが`effective[x].effectiveDateTime` または `.effectivePeriod` いずれの場合においてもSearch Parameterは `date`となる。

`subject`,`category`,`code`,`value-quantity`,`date` の各検索パラメータに一致する`Observation`リソースを含むBundleを検索する。

```
GET [base]/Observation?subject={reference}&category={token}&code={token}&value-quantity={quantity}&date={date}
```

例：
```
GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40&date=le2020-12-31
```

3.訪問診療等の検索：`subjet`（= 複数のPatientリソース：母集団としての患者範囲）、`category`（対象カテゴリ）、`code`（対象項目）、`value[x].valueQuantity`（値条件）、`encounter`（= `Encounter`リソース：対象医療行為）での検索をサポートすることが望ましい。（MAY）

`subject`,`category`,`code`,`value-quantity`,`date`,`encounter` の各検索パラメータに一致する`Observation`リソースを含むBundleを検索する。

```
GET [base]/Observation?subject={reference}&category={token}&code={token}&value-quantity={quantity}&date={date}&&encounter={encounter}
```

例：
```
GET [base]/Observation?subject=Patient/123&category=vital-signs&code=http://loinc.org|8867-4&value-quantity=gt40&date=le2020-12-31&encounter=Encounter/456
```


##### 2.1.3.1.5.5.2.2.3. オプション検索パラメータ

<!--
オプションとして次の検索パラメータをサポートすることができる。(MAY)
-->
オプション検索パラメータ(MAY)はありません。


#### 2.1.3.1.5.5.2.3. Operation一覧

| コンフォーマンス | オペレーション    | 説明                                                           |
| ---------------- | ------------- | ------------------------------------------------------------ |
| MAY | `$lastn` | `$lastn`オペレーションを使用すると、指定したある条件を満たす、最新のn件の`Observation`リソースを取得することができる。 |

##### 2.1.3.1.5.5.2.3.1. オプションオペレーション

オプションとして次のオペレーションをサポートすることができる。(MAY)

1. `Observation`用 `$lastn` オペレーション

`$lastn`オペレーションはある条件に基づく最新、または最新からn件の検査結果/測定結果等を取得するという一般的なニーズを満たすためのオペレーションである。例えば、直近の傾向を見るために、患者の過去5回分の体温を取得したり、最新の検査結果や媒体るサインを取得したりすることができる。 検索を行う際は、通常の`Observation`の検索パラメータと組み合わせて使用される。また、対象となる患者等を限定するための、`patient`または`subject`の検索パラメータ、およびカテゴリを指定する`category`検索パラメータは必須の検索パラメータとなる。

また取得される結果には以下のルールに従う。
- 追加パラメータによりフィルタされる
- 取得される結果は`Observation.code`の値によるグルーピング処理(Group by)される
- 新しいデータから古いデータの順にソートされる
- グループごとにmaxパラメータに指定された数だけ応答が返る。maxが指定されない場合は、最新の結果のみが返される。

この操作の公式なURLは以下である
```
http://hl7.org/fhir/OperationDefinition/Observation-lastn
```

###### 2.1.3.1.5.5.2.3.1.1. 入力パラメータ

| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| max  | 0..1   | positiveInt    |                |              | max は、`lastn` クエリ操作のオプションの入力パラメータです。これは、各グループから返す`Observation`の最大数を指定するために使用される。例えば、「ある患者のすべてのバイタルサイン結果から最新の3件を取得する」というクエリの場合、max = 3となる。 |



###### 2.1.3.1.5.5.2.3.1.2. 出力パラメータ

| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |


#### 2.1.3.1.5.5.2.4. サンプル

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
      .. snip ...
  ,{
   "fullUrl": "http://server/path/Observation/20170219-05temp",
       "resource": {
         "resourceType": "Observation",
         "id": "20170218temp",
      .. snip ...
    }
      .. snip ...
  ]
}
```

