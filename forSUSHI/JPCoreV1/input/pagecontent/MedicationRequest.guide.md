# 2.1.2.2. JP Core MedicationRequest（内服・外用薬剤処方）プロファイル

## 2.1.2.2.1. 概略
<br>

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequest |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreMedicationRequestProfile                                   |
| タイトル       | JP Core MedicationRequest Profile                               |
| ステータス     | アクティブ（2021-08-26）                                   |
| 定義           | このプロファイルはMedicationRequestリソースに対して、内服・外用薬剤処方のデータを送受信するための基礎となる制約と拡張を定めたものである。 |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpmedicationrequest |

<br>

このプロファイルは内服、外用の薬剤処方をMedicationRequestリソースを使用して表現する。薬剤処方は指示する項目、使用する用語集、プロセスなどにおいて諸外国と日本では異なっており、日本国内で規格を運用するためにExtensionの追加や用語集の追加・変更を行った。現在、日本での処方関連規格として利用されているJAHIS 処方データ交換規約 Ver 3.0C、JAHIS院外処方箋２次元シンボル記録条件規約 Ver.1.6およびSS-MIX2 Ver.1.2gを参考にし、療養担当則23条様式2号の処方箋形式を電子的に構成することを目的とした。ただし、院外処方に特化することはせず、院内処方も含めた様々なコンテキストで利用できることを目指している。
以下、このプロファイルのMedicationRequestリソースを「JP Core MedicationRequest Injectionリソース」と呼ぶ。

薬剤処方のFHIR仕様に関しては、先行事例として令和２年度厚⽣労働科学特別研究事業「診療情報提供書, 電⼦処⽅箋等の電⼦化医療⽂書の相互運⽤性確保のための標準規格の開発研究」研究班で策定された「電子処方箋HL7 FHIR記述仕様書案」（https://std.jpfhir.jp/ ）があるが、その中で院外処方以外でも利用できる仕様については可能な限り取り入れるようにした。ただし、拡張のURLは新たにJP Coreの命名規則に基づいて命名している。

### 2.1.2.2.1.1. 背景および想定シナリオ
本プロファイルは、以下のようなユースケースを想定している。

- 電子カルテから特定の患者の処方オーダ情報を検索する
- 電子処方箋において院外処方箋情報を記述する
- 退院時サマリや診療情報提供書において投薬情報を記述する
- 各種検査レポートや診断レポートにおいて投薬情報を記述する
- SS-MIX2やJAHIS処方データ交換規約に準拠した処方オーダメッセージをJSONに変換する

### 2.1.2.2.1.2. スコープ
#### 2.1.2.2.1.2.1. 対象
このプロファイルの対象は内服、外用の一般的な薬剤処方を電子的に連携するためのメッセージを記述することである。

#### 2.1.2.2.1.2.2. 対象としないこと
このプロファイルは内服、外用の薬剤に関するものであり、注射薬剤については対象としない。注射薬剤は、指示の仕方や指示する項目が内服、外用とは大きく異なるため、別のプロファイルとして記述することとする。

また、このプロファイルのMedicationRequestリソースは薬剤の指示（オーダー）に関するものであり、調剤や払い出し、内服確認や実施記録は対象としない。それぞれ、MedicationDispense, MedicationAdministrationが対応するリソースである。

また、療養担当則23条様式2号の処方箋形式の中で、患者情報、保険情報、処方医情報、医療機関情報などについては対象としない。それぞれ、Patient, Coverage, Practitioner, Organizationが対応するリソースである。

## 2.1.2.2.2. 関連するプロファイル
JP Core MedicationRequestリソースは、以下のリソースから直接参照される。

- JP Core MedicationDispenseリソース
- JP Core MedicationAdministrationリソース
- JP Core DiagnosticReportリソース
- JP Core Observationリソース

JP Core MedicationRequestリソースは、以下のリソースを直接参照する。

- JP Core Patientリソース
- JP Core Encounterリソース
- JP Core Practitionerリソース
- JP Core PractitionerRoleリソース
- JP Core Organizationリソース
- JP Core Coverageリソース
- JP Core Medicationリソース


## 2.1.2.2.3. リソース定義
[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/JPMedicationRequest)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/JPMedicationRequest/$download?format=json)

{{tree:jp-core-draftv1/JPMedicationRequest}}


### 2.1.2.2.3.1. 必須要素
次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

JP Core MedicationRequest リソースは、次の要素を持たなければならない。
- status : ステータスは必須であり、JP Coreでは"active"に固定される。
- intent : 意図は必須であり、JP Coreでは"intent" に固定される。
- medicationCodeableConcept : 医薬品の識別情報は必須であり、medicationCodeableConcept.coding.system, medicationCodeableConcept.coding.code, medicationCodeableConcept.coding.display が必ず存在しなければならない。
- subject :患者の参照情報は必須であり、subject.reference ないし subject.identifier が必ず存在しなければならない。
- authoredOn : 処方依頼日時であり、JP Coreでは必須である。
- dosageInstruction.text : フリーテキストの用法指示であり、JP Coreでは必須である。
- dosageInstruction.timing : 服⽤タイミングを記録し、JP Coreでは必須である。dosageInstruction.timing.code.coding.code, dosageInstruction.timing.code.coding.system が必ず存在しなければならない。
- dispenseRequest.quantity : 調剤量は必須であり、dispenseRequest.quantity.value, dispenseRequest.quantity.unit, dispenseRequest.quantity.system, dispenseRequest.quantity.code が必ず存在しなければならない 

JP Core MedicationRequestリソースは、次の要素をサポートしなければならない。
- medicationCodeableConcept : 医薬品の識別情報
- subject :患者の参照情報
- authoredOn : 処方依頼日時
- dosageInstruction.timing : 服⽤タイミング
- dispenseRequest.quantity : 調剤量

### 2.1.2.2.3.2. Extensions定義
JP Core MedicationRequest リソースで使用される拡張は次の通りである。

#### 2.1.2.2.3.2.1. JP Core MedicationRequest独自で追加されたExtension

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|服用開始日|服用開始日を格納する拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse|Period|
|実服用日数|実服用日数を格納する拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration|Duration|
|調剤指示|薬剤単位の調剤指示を表現するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense|string or CodeableConcept|
|頓用回数|頓用の場合など調剤量を錠数ではなく回数で表現したい場合の回数を格納する拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount|integer|

#### 2.1.2.2.3.2.2. 既存のExtensionの利用

既存のExtensionの利用は特にない。

### 2.1.2.2.3.3. 用語定義
HL7 FHIRの基底規格では、薬剤コードをはじめとして、剤形などでSNOMED CTが使われているが、日本ではライセンスの問題もあり普及していない。代替としてJAHIS処方データ交換規約やSS-MIX2で使われている用語集を採用した。

HL7 V2系では用語集を識別するコーディングシステム名(以下、「CS名」）は文字列であったが、FHIRではURIを指定する必要があるため、それぞれにURIを割り当てた。以下に使用する用語集のCS名とURI表記を列記する。

|分類|CS名|URI|
|---------|----|---------------------------|
|医薬品|HOT7|urn:oid:1.2.392.200119.4.403.2|
|医薬品|HOT9|urn:oid:1.2.392.200119.4.403.1|
|医薬品|HOT13|urn:oid:1.2.392.200119.4.402.1|
|医薬品|YJコード|urn:oid:1.2.392.100495.20.1.73|
|医薬品|⼀般処⽅名マスター|urn:oid:1.2.392.100495.20.1.81|
|剤形|MERIT-9(剤形)|http://jpfhir.jp/ePrewscription/CodeSystem/merit9-form |
|処方区分|MERIT-9(処方区分)|http://jpfhir.jp/ePrewscription/CodeSystem/merit9-category|
|処方区分|JAHIS処方データ交換規約Ver.3.0C(JHSP表0003)|http://jpfhir.jp/ePrewscription/CodeSystem/JHSP0003|
|薬品単位|MERIT-9(単位）|urn:oid:1.2.392.100495.20.2.101|
|力価区分|電子処方箋HL7 FHIR仕様(力価区分)|urn:oid:1.2.392.100495.20.2.22|
|調剤指示|電子処方箋HL7 FHIR仕様(調剤指示)|urn:oid:1.2.392.200250.2.2.30.10|
|用法|JAMI処方・注射オーダ標準用法規格(用法コード)|urn:oid:1.2.392.200250.2.2.20.20|
|用法|JAMI処方・注射オーダ標準用法規格(補足用法コード)|urn:oid:1.2.392.200250.2.2.20.22|
|投与部位|JAMI処方・注射オーダ標準用法規格(部位コード)|urn:oid:1.2.392.200250.2.2.20.32|
|投与経路|HL7 V2(使用者定義表0162)|http://terminology.hl7.org/CodeSystem/v2-0162|
|投与方法2桁コード|JAMI処方・注射オーダ標準用法規格(用法詳細区分)|urn:oid:1.2.392.200250.2.2.20.40|
|入外区分|HL7 V2(HL7表0482)|http://terminology.hl7.org/CodeSystem/v2-0482|

JP Core MedicationRequestリソースの各要素のバインディングは以下の通りである。

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| MedicationRequest.status | オーダーの現在の状態を示すコード | required | http://hl7.org/fhir/ValueSet/medicationrequest-status |
| MedicationRequest.medicationCodeableConcept | 医薬品の識別情報 | prefered | HOT7,HOT9,HOT13,YJコード,一般処方名マスター |
| MedicationRequest.dosageInstruction.additionalInstruction | 補足用法 | prefered | JAMI処方・注射オーダ標準用法規格(補足用法コード) |
| MedicationRequest.dosageInstruction.timing.code | 用法コード | prefered | JAMI処方・注射オーダ標準用法規格(用法コード) |
| MedicationRequest.dosageInstruction.site | 投与部位 | prefered | JAMI処方・注射オーダ標準用法規格(外用部位コード) |
| MedicationRequest.dosageInstruction.route | 投与経路 | prefered | HL7 V2(使用者定義表0162)|
| MedicationRequest.dosageInstruction.method | 投与方法 | prefered | JAMI処方・注射オーダ標準用法規格(用法詳細区分) |
| MedicationRequest.dosageInstruction.doseAndRate.doseQuantity.code | １回量単位 | prefered | MERIT-9(単位) |
| MedicationRequest.dosageInstruction.doseAndRate.doseRatio.numerator.code | １日量単位 | prefered | MERIT-9(単位) |
| MedicationRequest.dosageInstruction.doseAndRate.doseRatio.denominator.code | １日 | required | UCUM(http://hl7.org/fhir/ValueSet/ucum-units) |
| MedicationRequest.dispenseRequest.quantity.code | 調剤量単位 | prefered | MERIT-9(単位) |


### 2.1.2.2.3.4. 制約一覧
JP Core MedicationRequest リソースは、以下の制約を満たさなければならない。
- status : JP Coreでは"active"に固定される。
- intent : JP Coreでは"intent" に固定される。
- dosageInstruction.doseAndRage.doseRatio.denominator.value : １日量を記述する場合"1"に固定される。
- dosageInstruction.doseAndRage.doseRatio.denominator.unit : １日量を記述する場合"日"に固定される。
- dosageInstruction.doseAndRage.doseRatio.denominator.system : １日量を記述する場合"http://unitsofmeasure.org"に固定される。
- dosageInstruction.doseAndRage.doseRatio.denominator.code : １日量を記述する場合"d"に固定される。

### 2.1.2.2.3.5. 項目の追加
療養担当則23条では、「保険医は、処方箋を交付する場合には、様式第二号若しくは第二号の二又はこれらに準ずる様式の処方箋に必要な事項を記載しなければならない。」とされており、外来処方、院内処方の区分を明示していない。したがって、個別のユースケースにおいては一部を省略されることも前提の上で、規格としてはこれに準拠すべきと考え、様式に収載されている以下の項目を追加した。

* 服用開始日の追加（拡張「JP_MedicationRequest_DosageInstruction_PeriodOfUse」を使用）
* 実服用日数の追加（拡張「JP_MedicationRequest_DosageInstruction_UsageDuration」を使用）
* 頓用回数の追加（拡張「JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount」を使用）
* 調剤指示の追加（拡張「JP_MedicationRequest_DispenseRequest_InstructionForDispense」を使用）
* 一日量処方への対応（doseInstruction.doseAndRate.rateRatioを使用）
* RP番号、薬剤番号の追加（identifierを使用）
* ⼒価区分の追加（dosageInstruction.doseAndRate.typeを使用）


## 2.1.2.2.4. 利用方法

### 2.1.2.2.4.1. Interaction一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

#### 2.1.2.2.4.1.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/MedicationRequest?identifier=http://myhospital.com/fhir/medication\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/MedicationRequest?patient=123456   |
| SHOULD           | patient,date | referenece,date  | GET [base]/MedicationRequest?patient=123456&date=eq2013-01-14 |
| SHOULD           | patient,authoredon | reference,date  | GET [base]/MedicationRequest?patient=123456&authoredon=eq2013-01-14 |
| SHOULD         | patient,jp-core-startdate | date | GET [base]/MedicationRequest?patient=123456&jp-core-startdate=eq2013-03-21 |
| MAY           | date,authoredon,category,code,requester | date,date,token,token,token | GET [base]/MedicationRequest?code=urn:oid:1.2.392.100495.20.2.74\|105271807  |

##### 2.1.2.2.4.1.1.1. 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダーIDなどの識別子によるMedicationReuqestの検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/MedicationRequest?identifier={system|}[code]
   ```

   例：

   ```http
   GET [base]/MedicationRequest?identifier=http://myhospital.com/fhir/medication\|1234567890
   ```

   指定された識別子に一致するMedicationRequestリソースを含むBundleを検索する。
   

##### 2.1.2.2.4.1.1.2. 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. patient 検索パラメータを使用して、患者のリファレンス情報によるMedicationRequestの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/MedicationRequest?patient=[id]
   GET [base]/MedicationRequest?patient=[url]
   ```

   例：

   ```http
   GET [base]/MedicationRequest?patient=123456
   ```

   リソースIDが123456の患者のMedicationRequestリソースを含むBundleを検索する。

1. patient,date 検索パラメータを使用して、患者のリファレンス情報と服用日によるMedicationRequestの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/MedicationRequest?patient=[id]&date=[date]
   GET [base]/MedicationRequest?patient=[url]&date=[date]
   ```

   例：

   ```http
   GET [base]/MedicationRequest?patient=123456&date=eq2013-01-14
   ```

   リソースIDが123456の患者の2013-01-14に服用するMedicationRequestリソースを含むBundleを検索する。

1. patient,authoredon 検索パラメータを使用して、患者のリファレンス情報と依頼日によるMedicationRequestの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/MedicationRequest?patient=[id]&authoredon=[date]
   GET [base]/MedicationRequest?patient=[url]&authoredon=[date]
   ```

   例：

   ```http
   GET [base]/MedicationRequest?patient=123456&authoredon=eq2013-03-21
   ```

   リソースIDが123456の患者の2013-03-21に依頼されたMedicationRequestリソースを含むBundleを検索する。

##### 2.1.2.2.4.1.1.3. 追加検索パラメータ 

1. patient,jp-core-startdate 検索パラメータを使用して、患者のリファレンス情報と服用開始によるMedicationRequestの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/MedicationRequest?patient=[id]&jp-core-startdate=[date]
   GET [base]/MedicationRequest?patient=[url]&jp-core-startdate=[date]
   ```

   例：

   ```http
   GET [base]/MedicationRequest?patient=123456&jp-core-startdate=eq2013-03-21
   ```

   リソースIDが123456の患者の2013-03-21に服用を開始するMedicationRequestリソースを含むBundleを検索する。

#### 2.1.2.2.4.1.2. Operation一覧

JP MedicationRequest リソースに対して使用される操作は次の通りである。

- $everything：[base]/MedicationRequest/[id]/$everything

  - この操作が呼び出された特定のMedicationRequestに関連する全ての情報を返す。
    

#### 2.1.2.2.4.1.3. Operation 詳細

##### 2.1.2.2.4.1.3.1. $everything 操作

この操作は、この操作が呼び出された特定のMedicationRequestリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別されたMedicationRequestコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。

```http
http://hl7.jp/fhir/OperationDefinition/MedicationRequest-everything
```

URL: [base]/MedicationRequest/[id]/$everything

本操作は、べき等な操作である。


###### 2.1.2.2.4.1.3.1.1. 入力パラメータ

| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| start  | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。開始日が指定されていない場合、終了日以前のすべてのレコードが対象に含まれる。 |
| end    | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。終了日が指定されていない場合、開始日以降のすべてのレコードが対象に含まれる。 |
| _since | 0..1   | instant |                |              | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    |                |              | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer |                |              | Bundleの1ページに含まれるリソース件数を指定。                |

###### 2.1.2.2.4.1.3.1.2. 出力パラメータ

| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |

###### 2.1.2.2.4.1.3.1.3. 例

リクエスト：単一のMedicationRequestに関連する全てのリソースを取得する。

```http
GET [base]/MedicationRequest/1234567890/$everything
[some headers]
```

レスポンス：指定されたMedicationRequestに関連する全てのリソースを返す。

```http
HTTP/1.1 200 OK
[other headers]

{
  "resourceType": "Bundle",
  "id": "example",
  "meta": {
    "lastUpdated": "2014-08-18T01:43:33Z"
  },
  "type": "searchset",
  "entry": [
    {
      "fullUrl": "http://example.org/fhir/MedicationRequest/1234567890",
      "resource": {
        "resourceType": "MedicationRequest",

　　　　　・・・

　　　 },
    }
  ]
}  
```

### 2.1.2.2.4.2. サンプル
. 処方例1{{link:jp_medication_example_1.xml}}
1. 一日量処方例(JSON)
1. 不均等処方の一日量表現(JSON)
1. 分割処方箋(TBD)

#### 2.1.2.2.4.2.1. 処方箋メッセージ作成例
具体的な内服処方箋の作成例について、上記のサンプルのそれぞれについて解説する。

##### 2.1.2.2.4.2.1.1. 処方例１
この処方箋例では[JAHIS処方データ交換規約 Ver.3.0C](https://www.jahis.jp/standard/detail/id=564)98ページに記載されている下記の処方例をFHIRで表現する場合について解説する。
```
Rp1 ムコダイン錠２５０ｍｇ１錠（  １日３錠)
　パンスポリンＴ錠１００１００ｍｇ２錠（  １日６錠）
　　１日３回朝昼夕食後３日分
```

HL7ではFHIRに限らず、Ver 2以降全て欧米で使用されている1回量処方で記述されることにまず注意すべきである。（1日量処方への対応については後述する。）

処方箋の上記部分をFHIR R4で記述する場合以下のようになる。
<details>
<summary><b>FHIRでの処方例一部抜粋(クリックで展開)</b></summary>
<div>

```json
{
    "resource": {
        "resourceType": "MedicationRequest",
        "identifier": [{
                "system": "http://sample.com/medication",
                "value": "1234567890.1.1"
            },
            {
                "system": "urn:oid:1.2.392.100495.20.3.81",
                "value": "1"
            },
            {
                "system": "urn:oid:1.2.392.100495.20.3.82",
                "value": "1"
            }
        ],
        "intent": "order",
        "status": "active",
        "medicationCodeableConcept": {
            "coding": [{
                "system": "urn:oid:1.2.392.200119.4.403.1",
                "code": "103835401",
                "display": "ムコダイン錠２５０ｍｇ"
            }]
        },
        "subject": {
            "reference": "Patient/1234567890"
        },
        "dosageInstruction": [{
            "extension": [{
                    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse",
                    "valuePeriod": {
                        "start": "2020-04-01"
                    }
                },
                {
                    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration",
                    "valueDuration": {
                        "value": 3,
                        "unit": "日",
                        "system": "http://unitsofmeasure.org",
                        "code": "d"
                    }
                }
            ],
            "timing": {
                "code": {
                    "coding": [{
                        "system": "urn:oid:1.2.392.200250.2.2.20.20",
                        "code": "1013044400000000",
                        "display": "内服・経口・１日３回朝昼夕食後"
                    }]
                }
            },
            "route": {
                "coding": [{
                    "system": "urn:oid:2.16.840.1.113883.3.1937.777.10.5.162",
                    "code": "PO",
                    "display": "口"
                }]
            },
            "method": {
                "coding": [{
                    "system": "urn:oid:1.2.392.200250.2.2.20.40",
                    "code": "10",
                    "display": "経口"
                }]
            },
            "doseAndRate": [{
                "type": {
                    "coding": [{
                        "system": "urn:oid:1.2.392.100495.20.2.22",
                        "code": "1",
                        "display": "製剤量"
                    }]
                },
                "doseQuantity": {
                    "value": 1,
                    "unit": "錠",
                    "system": "urn:oid:1.2.392.100495.20.2.101",
                    "code": "TAB"
                },
                "rateRatio": {
                    "numerator": {
                        "value": 3,
                        "unit": "錠",
                        "system": "urn:oid:1.2.392.100495.20.2.101",
                        "code": "TAB"
                    },
                    "denominator": {
                        "value": 1,
                        "unit": "日",
                        "system": "http://unitsofmeasure.org",
                        "code": "d"
                    }
                }
            }]
        }],
        "dispenseRequest": {
            "quantity": {
                "value": 9,
                "unit": "錠",
                "system": "urn:oid:1.2.392.100495.20.2.101",
                "code": "TAB"
            },
            "expectedSupplyDuration": {
                "value": 3,
                "unit": "日",
                "system": "http://unitsofmeasure.org",
                "code": "d"
            }
        }
    }
}, {
    "resource": {
        "resourceType": "MedicationRequest",
        "identifier": [{
                "system": "http://sample.com/medication",
                "value": "1234567890.1.2"
            },
            {
                "system": "urn:oid:1.2.392.100495.20.3.81",
                "value": "1"
            },
            {
                "system": "urn:oid:1.2.392.100495.20.3.82",
                "value": "2"
            }
        ],
        "intent": "order",
        "status": "active",
        "medicationCodeableConcept": {
            "coding": [{
                "system": "urn:oid:1.2.392.200119.4.403.1",
                "code": "110626901",
                "display": "パンスポリンＴ錠１００ １００ｍｇ"
            }]
        },
        "subject": {
            "reference": "Patient/1234567890"
        },
        "dosageInstruction": [{
            "extension": [{
                    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse",
                    "valuePeriod": {
                        "start": "2020-04-01"
                    }
                },
                {
                    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration",
                    "valueDuration": {
                        "value": 3,
                        "unit": "日",
                        "system": "http://unitsofmeasure.org",
                        "code": "d"
                    }
                }
            ],
            "timing": {
                "code": {
                    "coding": [{
                        "system": "urn:oid:1.2.392.200250.2.2.20.20",
                        "code": "1013044400000000",
                        "display": "内服・経口・１日３回朝昼夕食後"
                    }]
                }
            },
            "route": {
                "coding": [{
                    "system": "urn:oid:2.16.840.1.113883.3.1937.777.10.5.162",
                    "code": "PO",
                    "display": "口"
                }]
            },
            "method": {
                "coding": [{
                    "system": "urn:oid:1.2.392.200250.2.2.20.40",
                    "code": "10",
                    "display": "経口"
                }]
            },
            "doseAndRate": [{
                "type": {
                    "coding": [{
                        "system": "urn:oid:1.2.392.100495.20.2.22",
                        "code": "1",
                        "display": "製剤量"
                    }]
                },
                "doseQuantity": {
                    "value": 2,
                    "unit": "錠",
                    "system": "urn:oid:1.2.392.100495.20.2.101",
                    "code": "TAB"
                },
                "rateRatio": {
                    "numerator": {
                        "value": 6,
                        "unit": "錠",
                        "system": "urn:oid:1.2.392.100495.20.2.101",
                        "code": "TAB"
                    },
                    "denominator": {
                        "value": 1,
                        "unit": "日",
                        "system": "http://unitsofmeasure.org",
                        "code": "d"
                    }
                }
            }]
        }],
        "dispenseRequest": {
            "quantity": {
                "value": 18,
                "unit": "錠",
                "system": "urn:oid:1.2.392.100495.20.2.101",
                "code": "TAB"
            },
            "expectedSupplyDuration": {
                "value": 3,
                "unit": "日",
                "system": "http://unitsofmeasure.org",
                "code": "d"
            }
        }
    }
}
```
</div>
</details>

### 2.1.2.2.4.3. サンプル
[JSONサンプル](templatejsonsample)
[その２](https://simplifier.net/packages/simplifier.core.r4.resources/4.0.0/files/18949/~json)

## 2.1.2.2.5. 注意事項

### 2.1.2.2.5.1. 記述の単位について
MedicationRequestは薬剤をCodeableConceptとして1つまでしか持つか、Medicationリソースのreferenceをもつことしかできない。したがって、複数の薬剤を同一のRp番号で表現する場合にはMedicationRequestを繰り返すか、複数の薬剤をまとめたMedication Resouceのインスタンスを参照することとなる。ワーキンググループでの検討の結果、冗長とはなるがidentifierにRp番号と薬剤番号を記録することとし、MedicationRequestを繰り返すことで表現する方法を推奨することとした。

### 2.1.2.2.5.2. 服用期間、実服用日数の記述方法
服用期間は、dosageInsturction.dosageInstruction.timing.repeat.boundsDuration要素に、Duration型を使用して記録する。本要素に指定される日数は、服用開始日から服用終了日までの全日数である。そのため、隔日投与や指定曜日の投与の場合には、服用しない日も日数に含まれることになり、処方箋に記録される実服用日数とは異なる値が記録されることとなる。服用期間とは別に実服用日数を表現したい場合には、dosageInstruction要素に対して定義した拡張「JP_MedicationRequest_DosageInstruction_UsageDuration」を使用し、Duration型で記載する。

Timingデータ型のrepeat.boundsDuration要素を使用した服用期間のインスタンス例を示す。
```json
"timing": {
  "repeat": {
    "boundsDuration": {
      "value": 7,
      "unit": "日",
      "system": "http://unitsofmeasure.org",
      "code": "d"
    }
  },
}
```
拡張「UsageDuration」を使用した実服用日数のインスタンス例を示す。
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration",
    "valueDuration": {
      "value": 7,
"unit": "日",
      "system": "http://unitsofmeasure.org",
      "code": "d"
    }
  }
]
```

### 2.1.2.2.5.3. 服用開始日の記述方法
交互投与や漸増漸減などの用法で服用開始日を明示する必要がある場合には、dosageInstruction要素に対して定義した拡張「JP_MedicationRequest_DosageInstruction_PeriodOfUse」を使用し、Period型で開始日を記録する。
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse",
    "valuePeriod": {
      "start": "2020-04-01"
    }
  }
]
``` 

### 2.1.2.2.5.4. １回量と１日量の記述方法
2010年1月に医療ミス防止の観点から、慣例として普及していた一日量処方ではなく、1回量処方を推奨するという「内服薬処方せんの記載方法の在り方に関する検討会報告書」が厚生労働省から出された。そもそも、HL7 FHIRでは1回量処方を前提としていることから、本ワーキンググループでも、1回量処方のみの対応で良いとの意見も出た。しかし、8年経過した＝ても処方箋の8割が一日量処方を使用しているとの報告があり、システムによっては1回量処方に対応していないことから一日量処方にも対応することとした。

1回量は、dosageInstruction.doseAndRate.doseQuantity要素 にSimpleQuantity型で記述する。単位コードには、医薬品単位略号（urn:oid:1.2.392.100495.20.2.101）を使用する。

また、処方期間の中で1日量が常に一定となる場合には、1回量に加えて1日量の記録も可能とし、dosageInstruction.doseAndRate.rateRatio 要素に Ratio型で記録する。Ratio型は比を扱うデータ型で、分母にあたる dosageInstruction.doseAndRate.rateRatio.denominator 要素には投与量の基準となる期間、つまり、1日量の場合は「1日」をQuantity型で指定する。単位には、単位コードUCUM（http://unitsofmeasure.org）より、「日」を表す単位コード「d」を使用する。分子にあたる dosageInstruction.doseAndRate.rateRatio.numerator要素には、1回量と同様の記法で、1日投与量をQuantity型で指定する。

投与量「1回1錠（1日3錠）」を記録したインスタンス例を示す。
```json
"doseAndRate": [ {
   "doseQuantity": {
      "value": 1,
      "unit": "錠",
      "system": "urn:oid:1.2.392.100495.20.2.101",
      "code": "TAB"
   },
   "rateRatio": {
      "numerator": {
         "value": 3,
         "unit": "錠",
         "system": "urn:oid:1.2.392.100495.20.2.101",
         "code": "TAB"
      },
      "denominator": {
         "value": 1,
         "unit": "日",
         "system": "http://unitsofmeasure.org",
         "code": "d"
      }
   }
} ]
```

doseQuantityエレメントは省略可能(0..1)である。

### 2.1.2.2.5.5. 力価区分の記述方法
用量は製剤量で記述することを基本とするが、必要に応じて原薬量指定も可能とする。この識別は、dosageInsturction.doseAndRate.type 要素に、力価区分コード（urn:oid:1.2.392.100495.20.2.22）を指定することで行い、製剤量は「1」、原薬量は「2」とする。本要素は、安全性のため省略せずに必須とする。

投与量「1回1錠（1日3錠）」を製剤量で記録したインスタンス例を示す。
```json
"dosageInstruction": [
  {
    "doseAndRate": [
      {
        "type": {
          "coding": [
            {
              "system": "urn:oid:1.2.392.100495.20.2.22",
              "code": "1",
              "display": "製剤量"
            }
          ]
        },
        "doseQuantity": {
          "value": 1,
          "unit": "錠",
          "system": "urn:oid:1.2.392.100495.20.2.101",
          "code": "TAB"
        },
        "rateRatio": {
          "numerator": {
            "value": 3,
            "unit": "錠",
            "system": "urn:oid:1.2.392.100495.20.2.101",
            "code": "TAB"
          },
          "denominator": {
            "value": 1,
            "unit": "日",
            "system": "http://unitsofmeasure.org",
            "code": "d"
          }
        }
      }
    ]
  }

```

### 2.1.2.2.5.6. 調剤量の記述方法
調剤量はdispenseRequest.quantityに、SimpleQuantity型で記録する。単位コードには、投与量と同様に医薬品単位略号（urn:oid:1.2.392.100495.20.2.101）を使用する。21錠（1日3錠×7日分）を調剤する場合のインスタンス例を以下に示す。
```json
"dispenseRequest": {
  "quantity": {
    "value": 21,
    "unit": "錠",
    "system": "urn:oid:1.2.392.100495.20.2.101",
    "code": "TAB"
  },
  "expectedSupplyDuration": {
    "value": 7,
    "unit": "日",
    "system": "http://unitsofmeasure.org",
    "code": "d"
  }
}
```

### 2.1.2.2.5.7. 調剤指示の記述方法
単一の薬剤に対する調剤指示は、dispenseRequest要素に対して定義した拡張「InstructionForDispense」を使用する。この拡張は、string型を使用してテキストとして指示の内容を記録できる拡張と、CodeableConcept型を使用してコード化された指示を記録できる拡張の２つを含んでおり、テキストによる指示とコードによる指示を並記することができる。一つの薬剤に対して、複数の指示を記録する場合には、この拡張を、拡張単位で繰り返して記録する。 
調剤指示で使用するコードは、電子処方箋HL7 FHIR仕様(調剤指示)("urn:oid:1.2.392.200250.2.2.30.10")を推奨する。

薬剤単位の調剤指示を表すインスタンス例を示す。
```json
"dispenseRequest": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense",
      "extension": [
        {
          "url": "TextContent",
          "valueString": "嚥下障害のため、上記粉砕指示"
        },
        {
          "url": "CodedContent",
          "valueCodeableConcept": {
            "coding": [
              {
                "code": "C",
                "system": "urn:oid:1.2.392.200250.2.2.30.10",
                "display": "粉砕指示"
              }
            ]
          }
        }
      ]
    }
  ],
```

### 2.1.2.2.5.8. 外用部位の記述方法
外用用法で部位を指定する場合は、dosageInstruction.site 要素に、CodeableConcept型で指定する。部位コードは、JAMI標準用法コード 表13 外用部位コード（"urn:oid:1.2.392.100495.20.2.33"）を使用する。
```json
"dosageInstruction": [
{
    "text": "外用・点眼・１日３回　１回１滴（右眼）",
    "timing": {
    "code": {
        "coding": [
        {
            "system": "urn:oid:1.2.392.200250.2.2.20.20",
            "code": "2H73000000000000",
            "display": "外用・点眼・１日３回"
        }
        ]
    }
    },
    "site": {
    "coding": [
        {
        "system": "urn:oid:1.2.392.200250.2.2.20.32",
        "code": "26R",
        "display": "右眼"
        }
    ]
    },

```

複数の部位ごとに投与量を記録する場合は、dosageInstruction 要素を複数繰り返す。

### 2.1.2.2.5.9. 頓用回数の記述方法
例えば「１回２錠、５回分（10錠）」など、頓用の場合に錠数ではなく回数で調剤量を表現したい場合には、dispenseRequest要素に対して定義した拡張「JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount」を使用し、integer型で頓用回数を記載する。
```json
"dispenseRequest": {
  "extension": {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount",
    "valueInterger": 5
  },
  "quantity": {
    "value": 10,
    "unit": "錠",
    "system": "urn:oid:1.2.392.100495.20.2.101",
    "code": "TAB"
  }
}
```

### 2.1.2.2.5.10. RP番号、薬剤番号の記述方法
HL7 FHIRでは、処方箋の中で同一の用法を持つ剤グループ(RP)は、剤単位に個別のMedicationRequestリソースに展開される。このとき、剤グループの番号（RP番号と呼ぶ）と、同一剤グループ内での順番は、いずれも MedicationRequestリソースの identifier で表現することができる。RP番号を識別するURIとして、"urn:oid:1.2.392.100495.20.3.81"を使用する。同一剤グループ内での順番を識別するURIとして、"urn:oid:1.2.392.100495.20.3.82"を使用する。value は 文字列型であり、数値はゼロサプレス、つまり、"01"でなく"1"と指定すること。
```json
"identifier": [
  {
    "system": "urn:oid:1.2.392.100495.20.3.81",
    "value": "1"
  },
  {
    "system": "urn:oid:1.2.392.100495.20.3.82",
    "value": "1"
  }
]
```

### 2.1.2.2.5.11. 処方箋番号(オーダーID)の記述方法
処方箋を識別する番号も、同様に MedicationRequestリソースの identifier 要素で表現することができる。Identifier 型のsystem 要素には、保険医療機関番号を含む処方箋ID の名前空間を表すOID（urn:oid:1.2.392.100495.20.3.11.1[保険医療機関コード(10 桁)]）を指定する。全国で⼀意になる発番ルールにもとづく場合には "urn:oid:1.2.392.100495.20.3.11" とする。
```json
"identifier": [
  {
    "system": "urn:oid:1.2.392.100495.20.3.11.1.11311234567",
    "value": "2020-00123456"
  },
]
```

### 2.1.2.2.5.12. 投与方法、投与経路
投与経路はdosageInstruction.route 要素にコードまたは文字列で指定する。使用するコード表は HL7 V2の使用者定義表0162 投薬経路を推奨し、その場合識別するURIとして、"urn:oid:2.16.840.1.113883.3.1937.777.10.5.162"を使用する。

「A:貼付」、「B:塗布」などJAMI標準用法コードにて用法詳細区分として表現される区分は、dosageInstruction.method 要素にコードまたは文字列で指定する。 用法詳細区分を識別するURIとして、"urn:oid:1.2.392.200250.2.2.20.40"を使用する。コードを指定する場合、基本用法区分＋用法詳細区分の２桁で指定する。

```json
"route": {
    "coding": [
        {
            "system": "urn:oid:2.16.840.1.113883.3.1937.777.10.5.162",
            "code": "AP",
            "display": "外用"
        }
    ]
},
"method": {
    "coding": [
        {
            "system": "urn:oid:1.2.392.200250.2.2.20.40",
            "code": "2B",
            "display": "塗布"
        }
    ]
},
```

### 2.1.2.2.5.13. 入外区分
薬剤オーダの入院、外来を区別するための区分として表現される入外区分は、HL7V2で定義されているHL7表0482を使用し、category要素にコードおよび文字列で指定することができる。入外区分を識別するURIとして、"http://terminology.hl7.org/CodeSystem/v2-0482"を使用する。
```json
"category": [ {
  "coding": [ {
    "system": "http://terminology.hl7.org/CodeSystem/v2-0482",
    "code": "O",
    "display": "外来オーダ"
  } ]
},
```


### 2.1.2.2.5.14. 処方区分
薬剤オーダの運用上の区分である処方区分は、MERIT-9(処方区分)およびJAHIS処方データ交換規約Ver.3.0CのJHSP表0007を使用し、category要素に2種類のコードおよび文字列で指定することができる。MERIT-9(処方区分)をしきべつするURIとして"http://jpfhir.jp/Common/CodeSystem/merit9-category"を、JHSP表0007を識別するURIとして"http://jpfhir.jp/Common/CodeSystem/JHSP0003"を使用する。

```json
"category": [ {
  "coding": [ {
    "system": "http://jpfhir.jp/Common/CodeSystem/merit9-category",
    "code": "OHP",
    "display": "外来処方"
  } ]
}, {
  "coding": [ {
    "system": "http://jpfhir.jp/Common/CodeSystem/merit9-category",
    "code": "OHO",
    "display": "院外処方"
  } ]
}, 
```

### 2.1.2.2.5.15. 各種コメントの記述方法
薬剤オーダのコメントとしては、薬剤単位につくもの、用法指示などRP単位につくもの、処方箋全体につくものがある。
全体のコメントはCommunicationリソースを使用し、薬剤単位、RP単位のコメントは、調剤指示以外はコード化されていれば dosageInstruction.additionalInstruction 要素ないしそうでないものは dosageInstruction.patientInstruction 要素を使用し、調剤指示は dispenseRequest要素に対して定義した拡張「InstructionForDispense」を使用する。

### 2.1.2.2.5.16. 不均等投与の記述方法
不均等用法は、「朝1 錠、昼2 錠、夕3 錠服用」など、1 日の中の服用タイミングごとに服用量が変化する用法である。不均等投与を1回投与ごとの複数の用法（1回用法）に分けて記述できる場合は、服用タイミングが異なる複数の剤グループとして表現することができる。しかし、不均等投与を1つの剤グループとして１つの用法（1日用法）でしか表現できないシステムもある。以下では、1回用法のインスタンス例と、1日用法でのインスタンス例をそれぞれ示す。

#### 2.1.2.2.5.16.1. １回用法の例
朝食後に4錠、昼食後2錠、夕食後1錠、合計1日投与量7錠であることを1回用法で３つの剤グループで表現したインスタンスの例である。
<details><summary>１回用法の例</summary><div>

```json
{
  "fullUrl": "urn:uuid:e0ebc512-f8fa-8551-5116-0320bd420395",
  "resource": {
    "resourceType": "MedicationRequest",
    "text": {
      "status": "generated",
      "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>RP:6</li><li>プレドニン錠５ｍｇ</li><li>１日１回　朝食後　１回４錠　７日分</li></ul></div>"
    },
    "extension": [
      {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration",
        "valueDuration": {
          "value": 7,
          "unit": "日",
          "system": "http://unitsofmeasure.org",
          "code": "d"
        }
      }
    ],
    "identifier": [
        {
            "system": "http://www.sample.com/fhir/medication-request",
            "value": "1234567890"
        },
        {
            "system": "urn:oid:1.2.392.100495.20.3.81",
            "value": "6"
        },
        {
            "system": "urn:oid:1.2.392.100495.20.3.82",
            "value": "1"
        }
    ],
    "status": "active",
    "intent": "order",
    "medicationCodeableConcept": {
      "coding": [
        {
          "system": "urn:oid:1.2.392.200119.4.403.1",
          "code": "105271807",
          "display": "プレドニン錠５ｍｇ"
        }
      ]
    },
    "subject": {
      "reference": "urn:uuid:1af0a9a6-a91d-3aef-fc4e-069995b89c4f"
    },
    "authoredOn": "2020-08-21T12:28:17+09:00",
    "dosageInstruction": [
      {
        "text": "内服・経口・１日１回朝食後　１回４錠　７日分",
        "timing": {
          "repeat": {
            "boundsDuration": {
              "value": 7,
              "unit": "日",
              "system": "http://unitsofmeasure.org",
              "code": "d"
            }
          },
          "code": {
            "coding": [
              {
                "system": "urn:oid:1.2.392.200250.2.2.20.20",
                "code": "1011000400000000",
                "display": "内服・経口・１日１回朝食後"
              }
            ]
          }
        },
        "route": {
          "coding": [
            {
              "system": "urn:oid:2.16.840.1.113883.3.1937.777.10.5.162",
              "code": "PO",
              "display": "口"
            }
          ]
        },
        "method": {
          "coding": [
            {
              "system": "urn:oid:1.2.392.200250.2.2.20.40",
              "code": "10",
              "display": "経口"
            }
          ]
        },
        "doseAndRate": [
          {
            "type": {
              "coding": [
                {
                  "system": "urn:oid:1.2.392.100495.20.2.22",
                  "code": "1",
                  "display": "製剤量"
                }
              ]
            },
            "doseQuantity": {
              "value": 4,
              "unit": "錠",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "TAB"
            }
          }
        ]
      }
    ],
    "dispenseRequest": {
      "quantity": {
        "value": 28,
        "unit": "錠",
        "system": "urn:oid:1.2.392.100495.20.2.101",
        "code": "TAB"
      },
      "expectedSupplyDuration": {
        "value": 7,
        "unit": "日",
        "system": "http://unitsofmeasure.org",
        "code": "d"
      }
    },
    "substitution": {
      "allowedCodeableConcept": {
        "coding": [
          {
            "system": "urn:oid:1.2.392.100495.20.2.41",
            "code": "0",
            "display": "変更可"
          }
        ]
      }
    }
  }
},
{
  "fullUrl": "urn:uuid:c39d005e-22e0-7991-bca2-565bff406e10",
  "resource": {
    "resourceType": "MedicationRequest",
    "text": {
      "status": "generated",
      "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>RP:7</li><li>プレドニン錠５ｍｇ</li><li>１日１回　昼食後　１回２錠　７日分</li></ul></div>"
    },
    "extension": [
      {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration",
        "valueDuration": {
          "value": 7,
          "unit": "日",
          "system": "http://unitsofmeasure.org",
          "code": "d"
        }
      }
    ],
    "identifier": [
      {
        "system": "urn:oid:1.2.392.100495.20.3.81",
        "value": "7"
      },
      {
        "system": "urn:oid:1.2.392.100495.20.3.82",
        "value": "1"
      }
    ],
    "status": "active",
    "intent": "order",
    "medicationCodeableConcept": {
      "coding": [
        {
          "system": "urn:oid:1.2.392.200119.4.403.1",
          "code": "105271807",
          "display": "プレドニン錠５ｍｇ"
        }
      ]
    },
    "subject": {
      "reference": "urn:uuid:1af0a9a6-a91d-3aef-fc4e-069995b89c4f"
    },
    "authoredOn": "2020-08-21T12:28:17+09:00",
    "dosageInstruction": [
      {
        "text": "内服・経口・１日１回昼食後　１回２錠　７日分",
        "timing": {
          "repeat": {
            "boundsDuration": {
              "value": 7,
              "unit": "日",
              "system": "http://unitsofmeasure.org",
              "code": "d"
            }
          },
          "code": {
            "coding": [
              {
                "system": "urn:oid:1.2.392.200250.2.2.20.20",
                "code": "1011004000000000",
                "display": "内服・経口・１日１回昼食後"
              }
            ]
          }
        },
        "route": {
          "coding": [
            {
              "system": "urn:oid:2.16.840.1.113883.3.1937.777.10.5.162",
              "code": "PO",
              "display": "口"
            }
          ]
        },
        "method": {
          "coding": [
            {
              "system": "urn:oid:1.2.392.200250.2.2.20.40",
              "code": "10",
              "display": "経口"
            }
          ]
        },
        "doseAndRate": [
          {
            "type": {
              "coding": [
                {
                  "system": "urn:oid:1.2.392.100495.20.2.22",
                  "code": "1",
                  "display": "製剤量"
                }
              ]
            },
            "doseQuantity": {
              "value": 2,
              "unit": "錠",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "TAB"
            }
          }
        ]
      }
    ],
    "dispenseRequest": {
      "quantity": {
        "value": 14,
        "unit": "錠",
        "system": "urn:oid:1.2.392.100495.20.2.101",
        "code": "TAB"
      },
      "expectedSupplyDuration": {
        "value": 7,
        "unit": "日",
        "system": "http://unitsofmeasure.org",
        "code": "d"
      }
    },
    "substitution": {
      "allowedCodeableConcept": {
        "coding": [
          {
            "system": "urn:oid:1.2.392.100495.20.2.41",
            "code": "0",
            "display": "変更可"
          }
        ]
      }
    }
  }
},
{
  "fullUrl": "urn:uuid:713d17e1-1e8b-dba1-95e2-763f179e805a",
  "resource": {
    "resourceType": "MedicationRequest",
    "text": {
      "status": "generated",
      "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>RP:8</li><li>プレドニン錠５ｍｇ</li><li>１日１回　夕食後　１回１錠　７日分</li></ul></div>"
    },
    "extension": [
      {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration",
        "valueDuration": {
          "value": 7,
          "unit": "日",
          "system": "http://unitsofmeasure.org",
          "code": "d"
        }
      }
    ],
    "identifier": [
      {
        "system": "urn:oid:1.2.392.100495.20.3.81",
        "value": "8"
      },
      {
        "system": "urn:oid:1.2.392.100495.20.3.82",
        "value": "1"
      }
    ],
    "status": "active",
    "intent": "order",
    "medicationCodeableConcept": {
      "coding": [
        {
          "system": "urn:oid:1.2.392.200119.4.403.1",
          "code": "105271807",
          "display": "プレドニン錠５ｍｇ"
        }
      ]
    },
    "subject": {
      "reference": "urn:uuid:1af0a9a6-a91d-3aef-fc4e-069995b89c4f"
    },
    "authoredOn": "2020-08-21T12:28:17+09:00",
    "dosageInstruction": [
      {
        "text": "内服・経口・１日１回夕食後　１回１錠　７日分",
        "timing": {
          "repeat": {
            "boundsDuration": {
              "value": 7,
              "unit": "日",
              "system": "http://unitsofmeasure.org",
              "code": "d"
            }
          },
          "code": {
            "coding": [
              {
                "system": "urn:oid:1.2.392.200250.2.2.20.20",
                "code": "1011040000000000",
                "display": "内服・経口・１日１回夕食後"
              }
            ]
          }
        },
        "route": {
          "coding": [
            {
              "system": "urn:oid:2.16.840.1.113883.3.1937.777.10.5.162",
              "code": "PO",
              "display": "口"
            }
          ]
        },
        "method": {
          "coding": [
            {
              "system": "urn:oid:1.2.392.200250.2.2.20.40",
              "code": "10",
              "display": "経口"
            }
          ]
        },
        "doseAndRate": [
          {
            "type": {
              "coding": [
                {
                  "system": "urn:oid:1.2.392.100495.20.2.22",
                  "code": "1",
                  "display": "製剤量"
                }
              ]
            },
            "doseQuantity": {
              "value": 1,
              "unit": "錠",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "TAB"
            }
          }
        ]
      }
    ],
    "dispenseRequest": {
      "quantity": {
        "value": 7,
        "unit": "錠",
        "system": "urn:oid:1.2.392.100495.20.2.101",
        "code": "TAB"
      },
      "expectedSupplyDuration": {
        "value": 7,
        "unit": "日",
        "system": "http://unitsofmeasure.org",
        "code": "d"
      }
    },
    "substitution": {
      "allowedCodeableConcept": {
        "coding": [
          {
            "system": "urn:oid:1.2.392.100495.20.2.41",
            "code": "0",
            "display": "変更可"
          }
        ]
      }
    }
  }
}
```
</div></details>

#### 2.1.2.2.5.16.2. １日用法の例
朝食後に4錠、昼食後2錠、夕食後1錠、合計1日投与量7錠であることを1日用法で表現したインスタンスの例である。
１つのMedicationRequestリソースの1つのdosageInstruction要素を使用し、dosageInstruction.doseAndRate.rateRatio要素に、1日投与量のみを記載する。1回の投与量の情報をコードとして記述できる場合は、dosageInstruction.additionalInstruction要素に、1 日の服用回数分だけ繰り返し、JAMI補足用法コードを使用し記述する。コード化できない場合は、明細単位の備考としてテキストで記述する。
<details><summary>１日用法の例</summary><div>

```json
"resource": {
  "resourceType": "MedicationRequest",
  "text": {
    "status": "generated",
    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\"><ul><li>RP:9</li>プレドニン錠５ｍｇ</ul><li>１日３回　毎食後（４錠－２錠－１錠）　７日分</li></div>"
  },
  "identifier": [
    {
      "system": "urn:oid:1.2.392.100495.20.3.81",
      "value": "9"
    },
    {
      "system": "urn:oid:1.2.392.100495.20.3.82",
      "value": "1"
    }
  ],
  "status": "active",
  "intent": "order",
  "medicationCodeableConcept": {
    "coding": [
      {
        "system": "urn:oid:1.2.392.200119.4.403.1",
        "code": "105271807",
        "display": "プレドニン錠５ｍｇ"
      }
    ]
  },
  "subject": {
    "reference": "urn:uuid:1af0a9a6-a91d-3aef-fc4e-069995b89c4f"
  },
  "authoredOn": "2020-08-21T12:28:17+09:00",
  "dosageInstruction": [
    {
      "additionalInstruction": [
        {
          "coding": [
            {
              "system": "urn:oid:1.2.392.200250.2.2.20.22",
              "code": "V14NNNNN",
              "display": "不均等・１回目・４錠"
            }
          ]
        },
        {
          "coding": [
            {
              "system": "urn:oid:1.2.392.200250.2.2.20.22",
              "code": "V22NNNNN",
              "display": "不均等・２回目・２錠"
            }
          ]
        },
        {
          "coding": [
            {
              "system": "urn:oid:1.2.392.200250.2.2.20.22",
              "code": "V31NNNNN",
              "display": "不均等・３回目・１錠"
            }
          ]
        }
      ],
      "text": "１日３回　毎食後　７錠",
      "timing": {
        "repeat": {
          "boundsDuration": {
            "value": 7,
            "unit": "日",
            "system": "http://unitsofmeasure.org",
            "code": "d"
          }
        },
        "code": {
          "coding": [
            {
              "system": "urn:oid:1.2.392.200250.2.2.20.20",
              "code": "1013044400000000",
              "display": "１日３回毎食後"
            }
          ]
        }
      },
      "route": {
        "coding": [
          {
            "system": "urn:oid:2.16.840.1.113883.3.1937.777.10.5.162",
            "code": "PO",
            "display": "口"
          }
        ]
      },
      "method": {
        "coding": [
          {
            "system": "urn:oid:1.2.392.200250.2.2.20.40",
            "code": "10",
            "display": "経口"
          }
        ]
      },
      "doseAndRate": [
        {
          "type": {
            "coding": [
              {
                "system": "urn:oid:1.2.392.100495.20.2.22",
                "code": "1",
                "display": "製剤量"
              }
            ]
          },
          "rateRatio": {
            "numerator": {
              "value": 7,
              "unit": "錠",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "TAB"
            },
            "denominator": {
              "value": 1,
              "unit": "日",
              "system": "http://unitsofmeasure.org",
              "code": "d"
            }
          }
        }
      ]
    }
  ],
  "dispenseRequest": {
    "quantity": {
      "value": 49,
      "unit": "錠",
      "system": "urn:oid:1.2.392.100495.20.2.101",
      "code": "TAB"
    },
    "expectedSupplyDuration": {
      "value": 7,
      "unit": "日",
      "system": "http://unitsofmeasure.org",
      "code": "d"
    }
  },
  "substitution": {
    "allowedCodeableConcept": {
      "coding": [
        {
          "system": "urn:oid:1.2.392.100495.20.2.41",
          "code": "0",
          "display": "変更可"
        }
      ]
    }
  }
}
```
</div></details>

### 2.1.2.2.5.17. 隔日指定投与の記述方法
隔日指定投与は、連続して服用する日数と、その後の連続して休薬する日数を指定する用法である。
JAMI標準用法コードを使用する表現方法と、HL7 FHIR本来の表現方法の2種類の表現方法が可能であるが、電子処方箋FHIR仕様との整合性を考慮してJAMI標準用法コードを使用する方法を推奨する。

JAMI標準用法コードを使用する表現方法では、dosageInstruction.timing.code 要素に CodeableConcept型でJAMI標準用法コード（urn:oid:1.2.392.100495.20.2.31）を指定する。さらに、dosageInstruction.timing.additionalInstrunction要素に、CodeableConcept型で、JAMI標準「処方・注射オーダ標準用法規格」 8桁補足用法コード（urn:oid:1.2.392.100495.20.2.32）を指定する。詳細は、「JAMI標準 処方注射オーダ標準用法規格」規格書 8.1「日数間隔指定」 を参照のこと。

用法「１日３回 朝昼夕食後 １回１錠 ７日分（隔日投与）」をJAMI標準用法コード、及び、補足用法コードで表現したインスタンス例を示す。
```json
"dosageInstruction": [
{
  "text": "１日３回　朝昼夕食後　１回１錠　７日分（隔日投与）",
  "additinalInstruction": {
      "coding": [
          {
          "system": "urn:oid:1.2.392.200250.2.2.20.22",
          "code": "I1100000",
          "display": "隔日投与"
          }
      ]
  },
  "timing": {
      "repeat": {
          "boundsDuration": {
              "value": 13,
              "unit": "日",
              "system": "http://unitsofmeasure.org",
              "code": "d"
          }
      },
      "code": {
          "coding": [
          {
              "system": "urn:oid:1.2.392.200250.2.2.20.20",
              "code": "1013044400000000 ",
              "display": "内服・経口・１日３回朝昼夕食後"
          }
          ]
      }
  },

```

なお、HL7 FHIR本来の表現方法では、dosageInstruction.timing.frequencyに1を、dosageInstruction.timing.periodに１＋休薬日数（隔日投与の場合1+1=2となる）を、dosageInstruction.timing.periodUnitに「日数」を意味する"d"を指定する。
```json
"dosageInstruction": [
  {
    "text": "１⽇３回 朝昼夕⾷後 １回１錠 ７⽇分（隔⽇投与）",
    "timing": {
      "boundsDuration": {
        "value": 13,
        "unit": "日",
        "system": "http://unitsofmeasure.org",
        "code": "d"
      },
      "frequency": 1,
      "period": 2,
      "periodUnit": "d",
    },
    "code": {
      "coding": [ {
        "system": "urn:oid:1.2.392.200250.2.2.20.20",
        "code": "1013044400000000 ",
        "display": "内服・経口・１日３回朝昼夕食後"
      } ]
    }
  },
```

### 2.1.2.2.5.18. 曜日指定投与の記述方法
曜日指定投与は、「火曜日と金曜日に服用」など、服用する曜日を指定する用法である。
JAMI標準用法コードを使用する表現方法と、HL7 FHIR本来の表現方法の2種類の表現方法が可能であるが、電子処方箋FHIR仕様との整合性を考慮してJAMI標準用法コードを使用する方法を推奨する。

JAMI標準用法コードを使用する表現方法では、dosageInstruction.timing.code 要素に CodeableConcept型でJAMI標準用法コード（urn:oid:1.2.392.100495.20.2.31）を指定する。さらに、dosageInstruction.timing.additionalInstrunction要素に、CodeableConcept型で、JAMI標準「処方・注射オーダ標準用法規格」 8桁補足用法コード（urn:oid:1.2.392.100495.20.2.32）を指定する。詳細は、「JAMI標準 処方注射オーダ標準用法規格」規格書 8.2「曜日指定」 を参照のこと。

曜日指定投与「１日１回 朝食後 １回１錠 （月曜日、木曜日）」を、JAMI標準用法コードで記録したインスタンス例を示す。
```json
"dosageInstruction": [
{
    "text": "１日１回　朝食後　１回１錠　（月曜日、木曜日）",
    "additinalInstruction": {
        "coding": [
            {
            "system": "urn:oid:1.2.392.200250.2.2.20.22",
            "code": "W0100100",
            "display": "月曜日、木曜日"
            }
        ]
    },
    "timing": {
    "code": {
        "coding": [
        {
            "system": "urn:oid:1.2.392.200250.2.2.20.20",
            "code": "1011000400000000 ",
            "display": "内服・経口・１日１回朝食後"
        }
        ]
    }
    },
```

なお、HL7 FHIR本来の表現方法では、dosageInstruction.timing.repeat.dayOfWeek 要素に値セットDaysOfWeek (http://hl7.org/fhir/ValueSet/days-of-week) を使用して、服用する曜日に対応するコードを配列で指定する。
```json
"dosageInstruction": [
{
  "text": "１日１回　朝食後　１回１錠　（月曜日、木曜日）",
  "timing": {
    "repeat": {
      "dayOfWeek": [
        "mon",
        "thu"
      ],
    },
    "code": {
      "coding": [ {
        "system": "urn:oid:1.2.392.200250.2.2.20.20",
        "code": "1011000400000000 ",
        "display": "内服・経口・１日１回朝食後"
      } ]
    }
}
```


## 2.1.2.2.6. その他、参考文献・リンク等
1. HL7, FHIR MedicationRequest Resource, http://hl7.org/fhir/medicationrequest.html
1. 保健医療福祉情報システム工業会, JAHIS 処方データ交換規約 Ver.3.0C, https://www.jahis.jp/standard/detail/id=564
1. 日本医療情報学会MERIT-9研究会, 医療情報交換規約運用指針、MERIT-9 処方オーダver 1.0, http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf
1. 保健医療福祉情報システム工業会, JAHISデータ交換規約（共通編）Ver.1.1, https://www.jahis.jp/standard/detail/id=125
1. 保健医療福祉情報システム工業会, JAHIS注射データ交換規約Ver.2.1C, https://www.jahis.jp/standard/detail/id=590
1. 児玉 義憲、hl7v2-to-fhir, 
https://github.com/Acedia-Belphegor/hl7v2-to-fhir/
1. Mike Henderson, 日本HL7協会監修、「HL7メッセージ交換」、第2版、インナービジョン社、2013年
1. 厚生労働省、保険医療機関及び保険医療養担当規則、平三〇厚労令二〇・一部改正, https://www.mhlw.go.jp/web/t_doc?dataId=84035000&dataType=0&pageNo=1
1. 一般社団法人医療情報システム開発センター, 医薬品HOT コードマスター, http://www2.medis.or.jp/hcode/
1. 日本医療情報学会、SS-MIX2仕様書・ガイドライン, http://www.jami.jp/jamistd/ssmix2.php
1. 保健医療福祉情報システム工業会, JAHIS電子処方箋実装ガイドVer.1.2, https://www.jahis.jp/standard/detail/id=774
1. 令和２年度厚⽣労働科学特別研究事業「診療情報提供書, 電⼦処⽅箋等の電⼦化医療⽂書の相互運⽤性確保のための標準規格の開発研究」研究班, 電子処方箋HL7 FHIR記述仕様書案, https://std.jpfhir.jp/