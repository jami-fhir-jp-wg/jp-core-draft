# 2.1.2.4. JP Core MedicationDispense（内服・外用薬剤処方調剤・払い出し記録）プロファイル

## 2.1.2.4.1. 概略
<br>

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreMedicationDispenseProfile                                   |
| タイトル       | JP Core MedicationDispense Profile                               |
| ステータス     | アクティブ（2021-08-26）                                   |
| 定義           | このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。 |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpmedicationdispense |

<br>

このプロファイルは内服、外用の薬剤処方の調剤情報をMedicationDispenseリソースを使用して表現する。薬剤処方は指示する項目、使用する用語集、プロセスなどにおいて諸外国と日本では異なっており、日本国内で規格を運用するためにExtensionの追加や用語集の追加・変更を行った。現在、日本での処方関連規格として利用されているJAHIS 処方データ交換規約 Ver 3.0C、JAHIS電子版お薬手帳データフォーマット仕様書Ver.2.4を参考にした。
以下、このプロファイルのMedicationDispenseリソースを「JP Core MedicationDispenseリソース」と呼ぶ。

薬剤処方のFHIR仕様に関しては、先行事例として令和２年度厚⽣労働科学特別研究事業「診療情報提供書, 電⼦処⽅箋等の電⼦化医療⽂書の相互運⽤性確保のための標準規格の開発研究」研究班で策定された「電子処方箋HL7 FHIR記述仕様書案」（https://std.jpfhir.jp/ ）があるが、その中で院外処方以外でも利用できる仕様については可能な限り取り入れるようにした。ただし、拡張のURLは新たにJP Coreの命名規則に基づいて命名している。

### 2.1.2.4.1.1. 背景および想定シナリオ
このプロファイルは、以下のようなユースケースを想定している。

- 医療機関内の薬剤部門システムや調剤薬局のシステムから特定の患者の処方調剤情報を検索する
- 電子処方箋において院外処方箋の調剤情報を記述する

### 2.1.2.4.1.2. スコープ
#### 2.1.2.4.1.2.1. 対象
このプロファイルの対象は内服、外用の一般的な薬剤処方の調剤情報を電子的に連携するためのメッセージを記述することである。

#### 2.1.2.4.1.2.2. 対象としないこと
このプロファイルは内服、外用の薬剤に関するものであり、注射薬剤については対象としない。注射薬剤は、指示の仕方や指示する項目が内服、外用とは大きく異なるため、別のプロファイルとして記述することとする。

また、このプロファイルのMedicationDispenseリソースは薬剤の調剤に関するものであり、指示（オーダー）、内服確認や実施記録は対象としない。それぞれ、MedicationRequest, MedicationAdministrationが対応するリソースである。

## 2.1.2.4.2. 関連するプロファイル
JP Core MedicationDispenseリソースは、以下のリソースから直接参照される。

- JP Core Observationリソース

JP Core MedicationDispenseリソースは、以下のリソースを直接参照する。

- JP Core Patientリソース
- JP Core Encounterリソース
- JP Core Practitionerリソース
- JP Core PractitionerRoleリソース
- JP Core Organizationリソース
- JP Core Coverageリソース
- JP Core MedicationRequestリソース
- JP Core Medicationリソース


## 2.1.2.4.3. リソース定義
[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/JPMedicationDispense)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/JPMedicationDispense/$download?format=json)

{{tree:jp-core-draftv1/JPMedicationDispense}}

### 2.1.2.4.3.1. 必須要素
次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

JP Core MedicationDispense リソースは、次の要素を持たなければならない。
- status : ステータスは必須である。
- medicationCodeableConcept : 医薬品の識別情報は必須であり、medicationCodeableConcept.coding.system, medicationCodeableConcept.coding.code, medicationCodeableConcept.coding.display が必ず存在しなければならない。
- subject :患者の参照情報は必須であり、subject.reference ないし subject.identifier が必ず存在しなければならない。
- whenHandedOver : 払い出し日時であり、JP Coreでは必須である。
- quantity : 調剤量は必須であり、quantity.value, quantity.unit, quantity.system, quantity.code が必ず存在しなければならない 
- dosageInstruction.text : フリーテキストの用法指示であり、JP Coreでは必須である。
- dosageInstruction.timing : 服⽤タイミングを記録し、JP Coreでは必須である。dosageInstruction.timing.code.coding.code, dosageInstruction.timing.code.coding.system が必ず存在しなければならない。

JP Core MedicationDispenseリソースは、次の要素をサポートしなければならない。
- medicationCodeableConcept : 医薬品の識別情報
- subject :患者の参照情報
- whenHandedOver : 払い出し日時
- quantity : 調剤量
- dosageInstruction.timing : 服⽤タイミング

### 2.1.2.4.3.2. Extensions定義
JP Core MedicationDispense リソースで使用される拡張は次の通りである。

#### 2.1.2.4.3.2.1. JP Core MedicationDispense独自で追加されたExtension

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|調剤結果|薬剤単位の調剤結果|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation|CodeableConcept|

#### 2.1.2.4.3.2.2. 既存のExtensionの利用

JP Core MedicationDispense リソースでは、JP Core MedicationRequestプロファイルで定義された以下の拡張を使用する。

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|服用開始日|服用開始日を格納する拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse|Period|
|実服用日数|実服用日数を格納する拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration|Duration|

### 2.1.2.4.3.3. 用語定義
HL7 FHIRの基底規格では、薬剤コードをはじめとして、剤形などでSNOMED CTが使われているが、日本ではライセンスの問題もあり普及していない。代替としてJAHIS処方データ交換規約やSS-MIX2で使われている用語集を採用した。

HL7 V2系では用語集を識別するコーディングシステム名(以下、「CS名」）は文字列であったが、FHIRではURIを指定する必要があるため、それぞれにURIを割り当てた。以下に使用する用語集のCS名とURI表記を列記する。

|分類|CS名|URI|
|---------|----|---------------------------|
|医薬品|HOT7|urn:oid:1.2.392.200119.4.403.2|
|医薬品|HOT9|urn:oid:1.2.392.200119.4.403.1|
|医薬品|HOT13|urn:oid:1.2.392.200119.4.402.1|
|医薬品|YJコード|urn:oid:1.2.392.100495.20.1.73|
|医薬品|⼀般処⽅名マスター|urn:oid:1.2.392.100495.20.1.81|
|剤形|MERIT-9(剤形)|http://jpfhir.jp/ePrescription/CodeSystem/merit9-form |
|薬品単位|MERIT-9(単位）|urn:oid:1.2.392.100495.20.2.101|
|力価区分|電子処方箋HL7 FHIR仕様(力価区分)|urn:oid:1.2.392.100495.20.2.22|
|用法|JAMI処方・注射オーダ標準用法規格(用法コード)|urn:oid:1.2.392.200250.2.2.20.20|
|用法|JAMI処方・注射オーダ標準用法規格(補足用法コード)|urn:oid:1.2.392.200250.2.2.20.22|
|部位|JAMI処方・注射オーダ標準用法規格(部位コード)|urn:oid:1.2.392.200250.2.2.20.32|
|投与方法|JAMI処方・注射オーダ標準用法規格(基本用法区分)|urn:oid:1.2.392.200250.2.2.20.30|
|投与経路|HL7 V2(使用者定義表0162)|http://terminology.hl7.org/CodeSystem/v2-0162|
|入外区分|HL7V2(HL7表0482)|http://terminology.hl7.org/CodeSystem/v2-0482|

JP Core MedicationDispenseリソースの各要素のバインディングは以下の通りである。

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| MedicationDispense.status | オーダーの現在の状態を示すコード | required | http://hl7.org/fhir/ValueSet/MedicationDispense-status |
| MedicationDispense.medicationCodeableConcept | 医薬品の識別情報 | prefered | HOT7,HOT9,HOT13,YJコード,一般処方名マスター |
| MedicationDispense.dosageInstruction.additionalInstruction | 補足用法 | prefered | JAMI処方・注射オーダ標準用法規格(補足用法コード) |
| MedicationDispense.dosageInstruction.timing.code | 用法コード | prefered | JAMI処方・注射オーダ標準用法規格(用法コード) |
| MedicationDispense.dosageInstruction.site | 投与部位 | prefered | JAMI処方・注射オーダ標準用法規格(外用部位コード) |
| MedicationDispense.dosageInstruction.route | 投与経路 | prefered | HL7 V2(HL7表0162)|
| MedicationDispense.dosageInstruction.method | 投与方法 | prefered | JAMI処方・注射オーダ標準用法規格(用法詳細区分) |
| MedicationDispense.dosageInstruction.doseAndRate.doseQuantity.code | １回量単位 | prefered | MERIT-9(単位) |
| MedicationDispense.dosageInstruction.doseAndRate.doseRatio.numerator.code | １日量単位 | prefered | MERIT-9(単位) |
| MedicationDispense.dosageInstruction.doseAndRate.doseRatio.denominator.code | １日 | required | UCUM(http://hl7.org/fhir/ValueSet/ucum-units) |
| MedicationDispense.quantity.code | 調剤量単位 | prefered | MERIT-9(単位) |

### 2.1.2.4.3.4. 制約一覧
JP Core MedicationDispense リソースは、以下の制約を満たさなければならない。
- dosageInstruction.doseAndRage.doseRatio.denominator.value : １日量を記述する場合"1"に固定される。
- dosageInstruction.doseAndRage.doseRatio.denominator.unit : １日量を記述する場合"日"に固定される。
- dosageInstruction.doseAndRage.doseRatio.denominator.system : １日量を記述する場合"http://unitsofmeasure.org"に固定される。
- dosageInstruction.doseAndRage.doseRatio.denominator.code : １日量を記述する場合"d"に固定される。

### 2.1.2.4.3.5. 項目の追加
療養担当則23条では、「保険医は、処方箋を交付する場合には、様式第二号若しくは第二号の二又はこれらに準ずる様式の処方箋に必要な事項を記載しなければならない。」とされており、外来処方、院内処方の区分を明示していない。
したがって、個別のユースケースにおいては一部を省略されることも前提の上で、規格としてはこれに準拠すべきと考え、様式に収載されている以下の項目を追加した。

* 服用開始日の追加（拡張「JP_MedicationRequest_DosageInstruction_PeriodOfUse」を使用）
* 実服用日数の追加（拡張「JP_MedicationRequest_DosageInstruction_UsageDuration」を使用）
* 調剤結果の追加（拡張「JP_MedicationDispense_Preparation」を使用）
* 一日量処方への対応（doseInstruction.doseAndRate.rateRatioを使用）
* RP番号、薬剤番号の追加（identifierを使用）
* ⼒価区分の追加（dosageInstruction.doseAndRate.typeを使用）

## 2.1.2.4.4. 利用方法

### 2.1.2.4.4.1. Interaction一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

#### 2.1.2.4.4.1.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/MedicationDispense?identifier=http://myhospital.com/fhir/medication\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/MedicationDispense?patient=123456   |
| SHOULD           | patient,whenhandedover | referenece,date  | GET [base]/MedicationDispense?patient=123456&whenhandedover=eq2013-01-14 |
| MAY           | whenhandedover,whenprepared,context,code,performer| date,date,token,token,token | GET [base]/MedicationDispense?code=urn:oid:1.2.392.100495.20.2.74\|105271807  |

##### 2.1.2.4.4.1.1.1. 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダーIDなどの識別子によるMedicationReuqestの検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/MedicationDispense?identifier={system|}[code]
   ```

   例：

   ```http
   GET [base]/MedicationDispense?identifier=http://myhospital.com/fhir/medication\|1234567890
   ```

   指定された識別子に一致するMedicationDispenseリソースを含むBundleを検索する。
   

##### 2.1.2.4.4.1.1.2. 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. patient 検索パラメータを使用して、患者のリファレンス情報によるMedicationDispenseの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/MedicationDispense?patient=[id]
   GET [base]/MedicationDispense?patient=[url]
   ```

   例：

   ```http
   GET [base]/MedicationDispense?patient=123456
   ```

   リソースIDが123456の患者のMedicationDispenseリソースを含むBundleを検索する。

1. patient,whenhandedover 検索パラメータを使用して、患者のリファレンス情報と払い出し日によるMedicationDispenseの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/MedicationDispense?patient=[id]&whenhandedover=[date]
   GET [base]/MedicationDispense?patient=[url]&whenhandedover=[date]
   ```

   例：

   ```http
   GET [base]/MedicationDispense?patient=123456&whenhandedover=eq2013-01-14
   ```

   リソースIDが123456の患者の2013-01-14に払い出されたMedicationDispenseリソースを含むBundleを検索する。


##### 2.1.2.4.4.1.1.3. 追加検索パラメータ 


#### 2.1.2.4.4.1.2. Operation一覧

JP Core MedicationDispense リソースに対して使用される操作は次の通りである。

- $everything：[base]/MedicationDispense/[id]/$everything

  - この操作が呼び出された特定のMedicationDispenseに関連する全ての情報を返す。
    

#### 2.1.2.4.4.1.3. Operation 詳細

##### 2.1.2.4.4.1.3.1. $everything 操作

この操作は、この操作が呼び出された特定のMedicationDispenseリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別されたMedicationDispenseコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。

```http
http://hl7.jp/fhir/OperationDefinition/MedicationDispense-everything
```

URL: [base]/MedicationDispense/[id]/$everything

本操作は、べき等な操作である。


###### 2.1.2.4.4.1.3.1.1. 入力パラメータ

| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| start  | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。開始日が指定されていない場合、終了日以前のすべてのレコードが対象に含まれる。 |
| end    | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。終了日が指定されていない場合、開始日以降のすべてのレコードが対象に含まれる。 |
| _since | 0..1   | instant |                |              | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    |                |              | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer |                |              | Bundleの1ページに含まれるリソース件数を指定。                |

###### 2.1.2.4.4.1.3.1.2. 出力パラメータ

| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |

###### 2.1.2.4.4.1.3.1.3. 例

リクエスト：単一のMedicationDispenseに関連する全てのリソースを取得する。

```http
GET [base]/MedicationDispense/1234567890/$everything
[some headers]
```

レスポンス：指定されたMedicationDispenseに関連する全てのリソースを返す。

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
      "fullUrl": "http://example.org/fhir/MedicationDispense/1234567890",
      "resource": {
        "resourceType": "MedicationDispense",

　　　　　・・・

　　　 },
    }
  ]
}  
```

### 2.1.2.4.4.2. サンプル
```
Rp1 ムコダイン錠２５０ｍｇ１錠（  １日３錠)
　　１日３回朝昼夕食後３日分
```

```JSON
{
    "resourceType": "MedicationDispense",
    "extension": [
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
    "identifier": [ 
        {
            "system": "http://www.sample.com/fhir/medication-dispense",
            "value": "1234567890"
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
    "status" : "completed",
    "category" : {
        "coding":  [
            {
                "system": "http://terminology.hl7.org/CodeSystem/v2-0482",
                "code": "I",
                "display": "入院オーダ"
            }
        ]
    },
    "medicationCodeableConcept": {
        "coding":  [
            {
                "system": "urn:oid:1.2.392.200119.4.403.1",
                "code": "103835401",
                "display": "ムコダイン錠２５０ｍｇ"
            }
        ]
    },
    "subject" : {
        "reference" : "Patient/1234567890"
    },
    "performer" : [
        {
            "function" : {
                "coding" : [
                    {
                        "code" : "packager",
                        "system" : "http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function",
                        "display" : "Packager"
                    }
                ]
            },
            "actor" : {
                "reference" : "Practitioner/01234567"
            }
        }
    ],
    "quantity": {
        "value": 9,
        "unit": "錠",
        "system": "urn:oid:1.2.392.100495.20.2.101",
        "code": "TAB"
    },
    "whenPrepared" : "2021-10-07T10:47:19+09:00",
    "whenHandedOver" : "2021-10-07T10:55:23+09:00",
    "destination" : {
        "reference" : "Location/12A"
    },
    "note" : [
        {
            "text" : "後発品へ変更可能か依頼医のＡ医師に確認したところ、患者の希望により不可との回答あり。"
        }
    ],
    "dosageInstruction":  [
        {
            "timing": {
                "code":  {
             "coding":  [
                 {
                     "system": "urn:oid:1.2.392.200250.2.2.20.20",
                     "code": "1013044400000000",
                     "display": "内服・経口・１日３回朝昼夕食後"
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
            "doseAndRate":  [
                {
                    "type": {
                        "coding":  [
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
    ],
    "substitution" : {
        "wasSubstituted" : true,
        "type" : {
            "coding" : [
                {
                    "code" : "G",
                    "system" : "http://terminology.hl7.org/CodeSystem/v3-substanceAdminSubstitution",
                    "display" : "generic composition"
                }
            ]
        },
        "reason": [
            {
                "coding" : [
                    {
                        "code" : "RR",
                        "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
                        "display" : "regulatory requirement"
                    }
                ]
            }
        ]
    }
}
```

## 2.1.2.4.5. 注意事項

### 2.1.2.4.5.1. 記述の単位について
MedicationDispenseは薬剤をCodeableConceptとして1つまでしか持つか、Medication Resourceのreferenceをもつことしかできない。
したがって、複数の薬剤を同一のRp番号で表現する場合にはMedicationDispenseを繰り返すか、複数の薬剤をまとめたMedication Resouceのインスタンスを参照することとなる。
ワーキンググループでの検討の結果、冗長とはなるがidentifierにRp番号と薬剤番号を記録することとし、MedicationDispenseを繰り返すことで表現する方法を推奨することとした。

### 2.1.2.4.5.2. 調剤量の記述方法
調剤量はquantityに、SimpleQuantity型で記録する。単位コードには、投与量と同様に医薬品単位略号（"urn:oid:1.2.392.100495.20.2.101"）を使用する。
調剤日数を記述したい場合は、daysSupply要素にSimpleQuantity方で記述し、単位コードはUCUM("http://unitsofmeasure.org")を使用する。

21錠（1日3錠×7日分）を調剤する場合のインスタンス例を以下に示す。

```json
"quantity": {
    "value": 21,
    "unit": "錠",
    "system": "urn:oid:1.2.392.100495.20.2.101",
    "code": "TAB"
},
"daysSupply": {
    "value": 7,
    "unit": "日",
    "system": "http://unitsofmeasure.org",
    "code": "d"
}
```

### 2.1.2.4.5.3. 力価区分の記述方法
用量は製剤量で記述することを基本とするが、必要に応じて原薬量指定も可能とする。この識別の記述方法は、JP Core MedicationRequestと同様とする。

### 2.1.2.4.5.4. 代替医薬品への変更内容の記述方法
調剤時に行ったジェネリック医薬品などへの変更内容の記述は、substitution.wasSubstituted, substitution.type, substitusion.reason を使用する。
変更の種類はデフォルトのコード表（"http://terminology.hl7.org/CodeSystem/v3-substanceAdminSubstitution"）を使用する。
変更の理由はデフォルトのコード表（"http://terminology.hl7.org/CodeSystem/v3-ActReason")を使用するかフリーテキストで記述する。ローカルのコード表を使用してもよい。

ジェネリック医薬品への変更の場合のインスタンス例を以下に示す。

```json
"substitution" : {
    "wasSubstituted" : true,
    "type" : {
        "coding" : [
            {
                "code" : "G",
                "system" : "http://terminology.hl7.org/CodeSystem/v3-substanceAdminSubstitution",
                "display" : "generic composition"
            }
        ]
    },
    "reason": [
        {
            "coding" : [
                {
                    "code" : "RR",
                    "system" : "http://terminology.hl7.org/CodeSystem/v3-ActReason",
                    "display" : "regulatory requirement"
                }
            ]
        }
    ]
}
```

### 2.1.2.4.5.5. 払い出し先
調剤された薬剤が払い出された先は、destination要素にReference型でLocationリソースの参照情報を記述する。

```json
"destination" : {
    "reference" : "Location/12A"
}
```

### 2.1.2.4.5.6. 払い出し日時
調剤された薬剤が払い出された日時は、whenHandedOver要素にdateTime型で記述する。

### 2.1.2.4.5.7. 調剤日時
薬剤が実際に調剤された日時は、whenPrepared要素にdateTime型で記述する。

### 2.1.2.4.5.8. 調剤実施者
調剤を実際に行った医療従事者は、performer.actor要素にReference型でPractitionerリソースの参照情報を記述する。役割に応じて複数の医療従事者を記述できる。

```json
"performer" : [
    {
        "function" : {
            "coding" : [
                {
                    "code" : "packager",
                    "system" : "http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function",
                    "display" : "Packager"
                }
            ]
        },
        "actor" : {
            "reference" : "Practitioner/01234567"
        }
    }
]
```

### 2.1.2.4.5.9. 調剤結果の記述方法
単一の薬剤に対する調剤結果は、MedicationDispenseに対して定義した拡張「JP_MedicationDispense_Preparation」を使用する。
この拡張は、CodeableConcept型を使用してテキストによる指示とコードによる指示のどちらかを記述することができる。
一つの薬剤に対して、複数の指示を記録する場合には、この拡張を、拡張単位で繰り返して記録する。 
調剤結果で使用するコードは、電子処方箋HL7 FHIR仕様(調剤指示)("urn:oid:1.2.392.200250.2.2.30.10")を推奨する。

薬剤単位の調剤結果を表すインスタンス例を示す。
```json
"extension": [
    {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation",
        "valueCodeableConcept": {
            "coding": [
                {
                "code": "C",
                "system": "urn:oid:1.2.392.200250.2.2.30.10",
                "display": "粉砕指示"
                }
            ]
        }
    }, {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationDispense_Preparation",
        "valueCodeableConcept": {
            "text" : "嚥下障害のため、上記粉砕指示"
        }
    } 
],

```

### 2.1.2.4.5.10. 疑義照会の内容
調剤時に行った疑義照会の内容は、note要素にAnnotation型で記述する。

### 2.1.2.4.5.11. 調剤時の特記事項（コメントなど）
調剤時の特記事項（コメントなど）も、note要素にAnnotation型で記述する。

### 2.1.2.4.5.12. 薬剤処方の各種指示情報の記述方法について
調剤の基となった薬剤処方の用法などの情報は、特に記述のない限り JP Core MedicationRequest と同様の記述方法とする。該当する項目としては以下のものがある。

* 服用期間、実服用日数
* 服用開始日
* １回量と１日量
* 外用部位
* RP番号、薬剤番号
* 処方箋番号（オーダーID）
* 投与方法、投与経路
* 入外区分
* 調剤指示以外の薬剤単位、RP単位のコメント
* 不均等投与
* 隔日投与、曜日指定投与


## 2.1.2.4.6. その他、参考文献・リンク等
1. HL7, FHIR MedicationDispense Resource, http://hl7.org/fhir/MedicationDispense.html
1. 保健医療福祉情報システム工業会, JAHIS 処方データ交換規約 Ver.3.0C, https://www.jahis.jp/standard/detail/id=564
1. 日本医療情報学会MERIT-9研究会, 医療情報交換規約運用指針、MERIT-9 処方オーダver 1.0, http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf
1. 保健医療福祉情報システム工業会, JAHISデータ交換規約（共通編）Ver.1.1, https://www.jahis.jp/standard/detail/id=125
1. 保健医療福祉情報システム工業会, JAHIS注射データ交換規約Ver.2.1C, https://www.jahis.jp/standard/detail/id=590
1. 児玉 義憲、hl7v2-to-fhir, 
https://github.com/Acedia-Belphegor/hl7v2-to-fhir/
1. Mike Henderson, 日本HL7協会監修、「HL7メッセージ交換」、第2版、インナービジョン社、2013年
1. 一般社団法人医療情報システム開発センター, 医薬品HOT コードマスター, http://www2.medis.or.jp/hcode/
1. 日本医療情報学会、SS-MIX2仕様書・ガイドライン, http://www.jami.jp/jamistd/ssmix2.php
1. 保健医療福祉情報システム工業会, JAHIS電子処方箋実装ガイドVer.1.2, https://www.jahis.jp/standard/detail/id=774
1. 令和２年度厚⽣労働科学特別研究事業「診療情報提供書, 電⼦処⽅箋等の電⼦化医療⽂書の相互運⽤性確保のための標準規格の開発研究」研究班, 電子処方箋HL7 FHIR記述仕様書案, https://std.jpfhir.jp/
