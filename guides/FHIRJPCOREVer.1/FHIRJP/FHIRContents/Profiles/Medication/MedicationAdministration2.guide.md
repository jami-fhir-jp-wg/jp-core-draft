# 2.1.2.7. JP Core MedicationAdministration Injection（注射薬剤処方投与実施情報）プロファイル

## 2.1.2.7.1. 概略
<br>

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration_Injection |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreMedicationAdministrationInjectionProfile                                   |
| タイトル       | JP Core MedicationAdministration Injection Profile                               |
| ステータス     | アクティブ（2021-08-26）                                   |
| 定義           | このプロファイルはMedicationAdministrationリソースに対して、注射薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。 |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpmedicationadministrationinjection |

<br>

このResource/Profileは注射の薬剤処方の投与実施情報を表現する。薬剤処方は指示する項目、使用する用語集、プロセスなどにおいて諸外国と日本では異なっており、日本国内で規格を運用するためにExtensionの追加や用語集の追加・変更を行った。現在、日本での注射関連規格として利用されている [JAHIS注射データ交換規約Ver.2.1C](https://www.jahis.jp/standard/detail/id=590) を参考にした。

### 2.1.2.7.1.1. 背景および想定シナリオ
本プロファイルは、以下のようなユースケースを想定している。

- 電子カルテから特定の患者の注射実施情報を検索する
- SS-MIX2やJAHIS注射データ交換規約に準拠した注射実施メッセージをJSONに変換する

### 2.1.2.7.1.2. スコープ
#### 2.1.2.7.1.2.1. 対象
このProfileの対象は注射の一般的な薬剤処方の投与実施情報を電子的に連携するためのメッセージを記述することである。

#### 2.1.2.7.1.2.2. 対象としないこと
このProfileは注射の薬剤に関するものであり、内服・外用薬剤については対象としない。内服・外用薬剤は、指示の仕方や指示する項目が注射とは大きく異なるため、別のProfileとして記述することとする。

また、このリソースは薬剤の投与実施に関するものであり、指示（オーダー）、調剤や払い出しは対象としない。それぞれ、MedicationRequest、MedicationDispense が対応するリソースである。

## 2.1.2.7.2. 関連するプロファイル
JP MedicationAdministrationリソースは、以下のリソースから直接参照される。

- JP Core Observationリソース
- JP Core Procedureリソース

JP MedicationAdministrationリソースは、以下のリソースを直接参照する。

- JP Core Patientリソース
- JP Core Encounterリソース
- JP Core Practitionerリソース
- JP Core PractitionerRoleリソース
- JP Core MedicationRequestリソース
- JP Core Medicationリソース


## 2.1.2.7.3. リソース定義
[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpmedicationadministrationinjection)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpmedicationadministrationinjection/$download?format=json)

{{tree:jp-core-draftv1/JPMedicationAdministrationInjection}}

### 2.1.2.7.3.1. 必須要素
次のデータ項目は必須（データが存在しなければならない）、あるいは、データが送信システムに存在する場合はサポートされなければならないことを意味する。（Must Support）。

MedicationAdministration リソースは、次の要素を持たなければならない。
- status : ステータスは必須であり、JP Coreでは `completed` or `stopped` に限定される。
- medicationCodeableConcept : 医薬品の識別情報は必須であり、medicationCodeableConcept.coding.system, medicationCodeableConcept.coding.code, medicationCodeableConcept.coding.display が必ず存在しなければならない。
- subject :患者の参照情報は必須であり、subject.reference ないし subject.identifier が必ず存在しなければならない。
- effectiveDateTime : 投与実施日時であり、JP Coreでは必須である。

※投与実施のユースケースにおいては、実施投与量(dose)が必須であることが望ましいが、ワーキンググループでの検討の結果、投与中止のユースケースも考慮して必須としない結論となった。

MedicationAdministrationリソースは、次の要素をサポートしなければならない。
- medicationCodeableConcept : 医薬品の識別情報
- subject :患者の参照情報
- effectiveDateTime : 投与実施日時

### 2.1.2.7.3.2. Extensions定義
MedicationAdministration リソースで使用される拡張は次の通りである。

#### 2.1.2.7.3.2.1. JP MedicationAdministration独自で追加されたExtension

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|依頼科|依頼科を格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment|CodeableConcept
|依頼医|依頼医を格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester|Reference(Practitioner)
|依頼日時|依頼日時を格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn|DateTime
|実施場所|実施場所を格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location|Reference(Location)
|投与経路コメント|投与経路コメントを格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Route_RouteComment|CodeableConcept/String
|投与部位コメント|投与部位コメントを格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Site_SiteComment|CodeableConcept/String
|手技コメント|手技コメントを格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Method_MethodComment|CodeableConcept/String
|ラインコメント|ラインコメントを格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_LineComment|CodeableConcept/String
|投与速度コメント|投与速度コメントを格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Rate_RateComment|CodeableConcept/String
|用法コメント|用法コメントを格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_DosageComment|CodeableConcept/String
|未分類コメント|未分類コメントを格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_UncategorizedComment|CodeableConcept/String

#### 2.1.2.7.3.2.2. 既存のExtensionの利用

JP_MedicationRequestInjectionで追加された以下のExtensionを利用する。

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|指示ライン|指示ラインを格納する拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line|CodeableConcept|


### 2.1.2.7.3.3. 用語定義
HL7 FHIRの基底規格では、薬剤コードをはじめとして、剤形などでSNOMED CTが使われているが、日本ではライセンスの問題もあり普及していない。代替としてJAHIS処方データ交換規約やSS-MIX2で使われている用語集を採用した。

HL7 V2系では用語集を識別するコーディングシステム名(以下、「CS名」）は文字列であったが、FHIRではURIを指定する必要があるため、それぞれにURIを割り当てた。以下に使用する用語集のCS名とURI表記を列記する。

★電子処方箋HL7 FHIR仕様を参照しているがよいか。

|分類|CS名|URI|
|---------|----|---------------------------|
|医薬品|HOT7|urn:oid:1.2.392.200119.4.403.|
|医薬品|HOT9|urn:oid:1.2.392.200119.4.403.1|
|医薬品|HOT13|urn:oid:1.2.392.200119.4.402.1|
|医薬品|YJコード|urn:oid:1.2.392.100495.20.1.73|
|医薬品|⼀般処⽅名マスター|urn:oid:1.2.392.100495.20.1.81|
|薬品単位|MERIT-9(単位）|urn:oid:1.2.392.100495.20.2.101|
|力価区分|電子処方箋HL7 FHIR仕様(力価区分)|urn:oid:1.2.392.100495.20.2.22|
|用法|JAMI処方・注射オーダ標準用法規格(用法コード)|urn:oid:1.2.392.200250.2.2.20.20|
|用法|JAMI処方・注射オーダ標準用法規格(補足用法コード)|urn:oid:1.2.392.200250.2.2.20.22|
|部位|JAMI処方・注射オーダ標準用法規格(部位コード)|urn:oid:1.2.392.200250.2.2.20.32|
|投与方法|JAMI処方・注射オーダ標準用法規格(基本用法区分)|urn:oid:1.2.392.200250.2.2.20.30|
|投与経路|JAMI処方・注射オーダ標準用法規格(用法詳細区分)|urn:oid:1.2.392.200250.2.2.20.40|
|入外区分|HL7V2(HL7表0482)|http://terminology.hl7.org/CodeSystem/v2-0482|

MedicationAdministrationの各要素のバインディングは以下の通りである。

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
| MedicationAdministration.status | 投与実施の状態を示すコード | required | http://hl7.org/fhir/ValueSet/medication-admin-status |
| MedicationAdministration.medicationCodeableConcept | 医薬品の識別情報 | prefered | HOT7,HOT9,HOT13,YJコード |
| MedicationAdministration.dosage.site | 投与部位 | prefered | JAMI処方・注射オーダ標準用法規格(外用部位コード) |
| MedicationAdministration.dosage.route | 投与経路 | prefered | JAMI処方・注射オーダ標準用法規格(用法詳細区分) |
| MedicationAdministration.dosage.method | 投与方法 | prefered | JAMI処方・注射オーダ標準用法規格(基本用法区分) |
| MedicationAdministration.dosage.dose.code | １回量単位 | prefered | MERIT-9(単位) |


### 2.1.2.7.3.4. 制約一覧
MedicationAdministration リソースは、以下の制約を満たさなければならない。
- status : JP Coreでは `completed` or `stopped` に限定される。

### 2.1.2.7.3.5. 項目の追加
MedicationAdministrationリソースでは、依頼元のMedicationRequestリソースをrequest要素にReferenceで参照できるようになっているが、
依頼元のMedicationRequestリソースが取得できないケースも考慮して、依頼情報を直接記述できるように以下の項目を追加した。

* 依頼科の追加（拡張「JP_MedicationAdministration_RequestDepartment」を使用）
* 依頼医の追加（拡張「JP_MedicationAdministration_Requester」を使用）
* 依頼日時の追加（拡張「JP_MedicationAdministration_RequestAuthoredOn」を使用）

また、投薬実施場所（病棟、病室、ベッド番号など）を記述できるように以下の項目を追加した。

* 実施場所の追加（拡張「JP_MedicationAdministration_Location」を使用）

## 2.1.2.7.4. 利用方法

### 2.1.2.7.4.1. Interaction一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

#### 2.1.2.7.4.1.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/MedicationAdministration?identifier=http://myhospital.com/fhir/medication\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/MedicationAdministration?patient=123456   |
| SHOULD           | patient,effective-time | referenece,date  | GET [base]/MedicationAdministration?patient=123456&effective-time=eq2013-01-14 |
| MAY           | TBD | TBD | GET [base]/MedicationAdministration?code=urn:oid:1.2.392.100495.20.2.74\|105271807  |

##### 2.1.2.7.4.1.1.1. 必須検索パラメータ

次の検索パラメータは必須でサポートされなければならない。

1. identifier 検索パラメータを使用して、オーダーIDなどの識別子によるMedicationAdministrationの検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/MedicationAdministration?identifier={system|}[code]
   ```

   例：

   ```http
   GET [base]/MedicationAdministration?identifier=http://myhospital.com/fhir/medication\|1234567890
   ```

   指定された識別子に一致するMedicationAdministrationリソースを含むBundleを検索する。
   

##### 2.1.2.7.4.1.1.2. 推奨検索パラメータ

次の検索パラメータをサポートすることが望ましい。

1. patient 検索パラメータを使用して、患者のリファレンス情報によるMedicationAdministrationの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/MedicationAdministration?patient=[id]
   GET [base]/MedicationAdministration?patient=[url]
   ```

   例：

   ```http
   GET [base]/MedicationAdministration?patient=123456
   ```

   リソースIDが123456の患者のMedicationAdministrationリソースを含むBundleを検索する。

1. patient,effective-time 検索パラメータを使用して、患者のリファレンス情報と払い出し日によるMedicationAdministrationの検索をサポートすることが望ましい（SHOULD）。

   ```http
   GET [base]/MedicationAdministration?patient=[id]&effective-time=[date]
   GET [base]/MedicationAdministration?patient=[url]&effective-time=[date]
   ```

   例：

   ```http
   GET [base]/MedicationAdministration?patient=123456&effective-time=eq2013-01-14
   ```

   リソースIDが123456の患者の2013-01-14に投与実施されたMedicationAdministrationリソースを含むBundleを検索する。


##### 2.1.2.7.4.1.1.3. 追加検索パラメータ 

#### 2.1.2.7.4.1.2. Operation一覧

JP MedicationAdministration リソースに対して使用される操作は次の通りである。

- $everything：[base]/MedicationAdministration/[id]/$everything

  - この操作が呼び出された特定のMedicationAdministrationに関連する全ての情報を返す。
    

#### 2.1.2.7.4.1.3. Operation 詳細

##### 2.1.2.7.4.1.3.1. $everything 操作

この操作は、この操作が呼び出された特定のMedicationAdministrationリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別されたMedicationAdministrationコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。

```http
http://hl7.jp/fhir/OperationDefinition/MedicationAdministration-everything
```

URL: [base]/MedicationAdministration/[id]/$everything

本操作は、べき等な操作である。


###### 2.1.2.7.4.1.3.1.1. 入力パラメータ

| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| start  | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。開始日が指定されていない場合、終了日以前のすべてのレコードが対象に含まれる。 |
| end    | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。終了日が指定されていない場合、開始日以降のすべてのレコードが対象に含まれる。 |
| _since | 0..1   | instant |                |              | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    |                |              | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer |                |              | Bundleの1ページに含まれるリソース件数を指定。                |

###### 2.1.2.7.4.1.3.1.2. 出力パラメータ

| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |

###### 2.1.2.7.4.1.3.1.3. 例

リクエスト：単一のMedicationAdministrationに関連する全てのリソースを取得する。

```http
GET [base]/MedicationAdministration/1234567890/$everything
[some headers]
```

レスポンス：指定されたMedicationAdministrationに関連する全てのリソースを返す。

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
      "fullUrl": "http://example.org/fhir/MedicationAdministration/1234567890",
      "resource": {
        "resourceType": "MedicationAdministration",

　　　　　・・・

　　　 },
    }
  ]
}  
```

### 2.1.2.7.4.2. サンプル
[JAHIS注射データ交換規約Ver.2.1C](https://www.jahis.jp/standard/detail/id=590)に記載されている下記の注射実施メッセージをFHIRで表現する場合のサンプル

<details>
<summary>（２）実施情報（ワンショット）</summary>

| 項目名 | 項目値 | 備考 |
| :--- | :--- | :--- |
| オーダ番号 | 123456789012345 |
| 入外区分 | 入院 (I) |
| 依頼科 | 内科 (01) |
| 依頼医 | 医師 一郎 (10001) |
| Rp番号 | 01 |
| 施用番号 | 001 |
| 実施投与経路 | 静脈内 (IV) |
| 実施投与部位 | 右腕 (ARM,R) |
| 実施投与部位コメント | 左利きのため |
| 実施投与装置 | シリンジ (01) |
| 実施手技 | 静注(末梢) (101) |
| 実施手技コメント | １分ほどかけて緩徐に行いました |
| 実施用法コメント | 痙攣が発生したため、主治医に確認の上実施しました |
| 実施投薬剤 | ホリゾン注射液10mg (100558502) |
| 実施投薬量 | 1 |
| 分量単位 | アンプル (AMP) |
| 実施開始日時 | 2016/07/01 10:05:21 |
| 実施終了日時 | (指定なし) |
| 実施者 | 看護 花子 (20001) |
| 実施場所 | 09A/021/4 |
| 進捗 | 完了 (CP) |

```json
{
  "resourceType": "MedicationAdministration",
  "contained": [
    {
      "resourceType": "Medication",
      "id": "medication1",
      "ingredient": [
        {
          "itemCodeableConcept": {
            "coding": [
              {
                "system": "urn:oid:1.2.392.100495.20.2.74",
                "code": "100558502",
                "display": "ホリゾン注射液１０ｍｇ"
              }
            ]
          },
          "strength": {
            "numerator": {
              "value": 1,
              "unit": "アンプル",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "AMP"
            },
            "denominator": {
              "value": 1,
              "unit": "回",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "KAI"
            }
          }
        }
      ]
    },
    {
      "resourceType": "BodyStructure",
      "id": "bodystructure1",
      "location": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0550",
            "code": "ARM",
            "display": "腕"
          }
        ]
      },
      "locationQualifier": [
        {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/v2-0495",
              "code": "R",
              "display": "右"
            }
          ]
        }
      ],
      "patient": {
        "reference": "Patient/1"
      }
    },
    {
      "resourceType": "Device",
      "id": "device1",
      "type": {
        "coding": [
          {
            "system": "http://hl7fhir.jp/medication/99ILL",
            "code": "01",
            "display": "シリンジ"
          }
        ]
      }
    }
  ],
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "urn:oid:1.2.392.100495.20.2.51",
            "code": "01",
            "display": "内科"
          }
        ]
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester",
      "valueReference": {
        "reference": "Practitioner/2",
        "display": "医師 一郎"
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn",
      "valueDateTime": "2016-07-01T00:00:00+09:00"
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location",
      "valueReference": {
        "reference": "Location/1",
        "display": "09A病棟 021病室 4ベッド"
      }
    }
  ],
  "identifier": [
    {
      "system": "http://www.example.com/fhir/order-number",
      "value": "123456789012345"
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
  "status": "completed",
  "category": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0482",
        "code": "I",
        "display": "入院オーダ"
      }
    ]
  },
  "medicationReference": {
    "reference": "#medication1",
    "type": "Medication"
  },
  "subject": {
    "reference": "Patient/1"
  },
  "effectivePeriod": {
    "start": "2016-07-01T10:05:21+09:00",
    "end": "2016-07-01T10:05:21+09:00"
  },
  "performer": [
    {
      "function": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/med-admin-perform-function",
            "code": "performer",
            "display": "Performer"
          }
        ]
      },
      "actor": {
        "reference": "Practitioner/1",
        "display": "看護 花子"
      }
    }
  ],
  "request": {
    "reference": "MedicationRequest/1"
  },
  "device": [
    {
      "reference": "#device1",
      "display": "シリンジ"
    }
  ],
  "dosage": {
    "extension": [
      {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_DosageComment",
        "valueString": "痙攣が発生したため、主治医に確認の上実施しました"
      }
    ],
    "site": {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/bodySite",
          "valueReference": {
            "reference": "#bodystructure1",
            "display": "右腕"
          }
        },
        {
          "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Site_SiteComment",
          "valueString": "左利きのため"
        }
      ]
    },
    "route": {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v2-0162",
          "code": "IV",
          "display": "静脈内"
        }
      ]
    },
    "method": {
      "extension": [
        {
          "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Method_MethodComment",
          "valueString": "１分ほどかけて緩徐に行いました"
        }
      ],
      "coding": [
        {
          "system": "http://hl7fhir.jp/99ILL",
          "code": "101",
          "display": "静注(末梢)"
        }
      ]
    },
    "dose": {
      "value": 2,
      "unit": "mL",
      "system": "http://unitsofmeasure.org",
      "code": "mL"
    }
  }        
}
```

</details>

<details>
<summary>（４）実施情報（点滴実施）</summary>

| 項目名 | 項目値 | 備考 |
| :--- | :--- | :--- |
| オーダ番号 | 123456789012345 |
| 入外区分 | 入院 (I) |
| 依頼科 | 内科 (01) |
| 依頼医 | 医師 一郎 (10001) |
| Rp番号 | 01 |
| 施用番号 | 001 |
| 実施投与経路 | 静脈内 (IV) |
| 実施投与部位 | 左腕 (ARM,L) |
| 実施手技 | IVプッシュ (IVP) |
| 薬品 #1 |
| #1 実施投薬剤 | ソリタ－Ｔ３号輸液５００ｍＬ (107750602) |
| #1 実施投薬量 | 1 |
| #1 分量単位 | 本 (HON) |
| #1 実施開始日時 | 2016/07/01 08:05:21 |
| #1 実施終了日時 | 2016/07/01 13:05:43 |
| #1 投与速度 | 102ml/hr  |
| #1 実施者 | 看護 花子 (20001) |
| #1 実施場所 | 09A/021/4 |
| #1 進捗 | 完了 (CP) |
| 薬品 #2 |
| #2 実施投薬剤 | アドナ注（静脈用）50mg／10mL (108010001) |
| #2 実施投薬量 | 1 |
| #2 分量単位 | アンプル (AMP) |
| #2 実施開始日時 | 2016/07/01 08:05:21 |
| #2 実施終了日時 | 2016/07/01 13:05:43 |
| #2 投与速度 | 102ml/hr  |
| #2 実施者 | 看護 花子 (20001) |
| #2 実施場所 | 09A/021/4 |
| #2 進捗 | 完了 (CP) |

```json
{
  "resourceType": "MedicationAdministration",
  "contained": [
    {
      "resourceType": "Medication",
      "id": "medication1",
      "ingredient": [
        {
          "itemCodeableConcept": {
            "coding": [
              {
                "system": "urn:oid:1.2.392.100495.20.2.74",
                "code": "107750602",
                "display": "ソリタ－Ｔ３号輸液５００ｍＬ"
              }
            ]
          },
          "strength": {
            "numerator": {
              "value": 1,
              "unit": "本",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "HON"
            },
            "denominator": {
              "value": 1,
              "unit": "回",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "KAI"
            }
          }
        },
        {
          "itemCodeableConcept": {
            "coding": [
              {
                "system": "urn:oid:1.2.392.100495.20.2.74",
                "code": "108010001",
                "display": "アドナ注（静脈用）５０ｍｇ／１０ｍＬ"
              }
            ]
          },
          "strength": {
            "numerator": {
              "value": 1,
              "unit": "アンプル",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "AMP"
            },
            "denominator": {
              "value": 1,
              "unit": "回",
              "system": "urn:oid:1.2.392.100495.20.2.101",
              "code": "KAI"
            }
          }
        }
      ]
    },
    {
      "resourceType": "BodyStructure",
      "id": "bodystructure1",
      "location": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0550",
            "code": "ARM",
            "display": "腕"
          }
        ]
      },
      "locationQualifier": [
        {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/v2-0495",
              "code": "L",
              "display": "左"
            }
          ]
        }
      ],
      "patient": {
        "reference": "Patient/1"
      }
    }
  ],
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "urn:oid:1.2.392.100495.20.2.51",
            "code": "01",
            "display": "内科"
          }
        ]
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester",
      "valueReference": {
        "reference": "Practitioner/2",
        "display": "医師 一郎"
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn",
      "valueDateTime": "2016-07-01T00:00:00+09:00"
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location",
      "valueReference": {
        "reference": "Location/1",
        "display": "09A病棟 021病室 4ベッド"
      }
    }
  ],
  "identifier": [
    {
      "system": "http://www.example.com/fhir/order-number",
      "value": "123456789012345"
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
  "status": "completed",
  "category": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0482",
        "code": "I",
        "display": "入院オーダ"
      }
    ]
  },
  "medicationReference": {
    "reference": "#medication1",
    "type": "Medication"
  },
  "subject": {
    "reference": "Patient/1"
  },
  "effectivePeriod": {
    "start": "2016-07-01T08:05:21+09:00",
    "end": "2016-07-01T13:05:43+09:00"
  },
  "performer": [
    {
      "function": {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/med-admin-perform-function",
            "code": "performer",
            "display": "Performer"
          }
        ]
      },
      "actor": {
        "reference": "Practitioner/1",
        "display": "看護 花子"
      }
    }
  ],
  "request": {
    "reference": "MedicationRequest/1"
  },
  "dosage": {
    "extension": [
      {
        "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://hl7fhir.jp/medication/99ILL",
              "code": "01",
              "display": "主管"
            }
          ]
        }
      }
    ],
    "site": {
      "extension": [
        {
          "url": "http://hl7.org/fhir/StructureDefinition/bodySite",
          "valueReference": {
            "reference": "#bodystructure1",
            "display": "左腕"
          }
        }
      ]
    },
    "route": {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v2-0162",
          "code": "IV",
          "display": "静脈内"
        }
      ]
    },
    "method": {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v2-0165",
          "code": "IVP",
          "display": "IVプッシュ"
        }
      ]
    },
    "dose": {
      "value": 510,
      "unit": "mL",
      "system": "http://unitsofmeasure.org",
      "code": "mL"
    },
    "rateRatio": {
      "numerator": {
        "value": 102,
        "unit": "mL",
        "system": "http://unitsofmeasure.org",
        "code": "mL"
      },
      "denominator": {
        "value": 1,
        "unit": "h",
        "system": "http://unitsofmeasure.org",
        "code": "h"
      }
    }
  }
}
```

</details>

## 2.1.2.7.5. 注意事項

### 2.1.2.7.5.1. 記述の単位について
MedicationAdministrationは薬剤をCodeableConceptとして1つまでしか持つか、Medicationリソースのreferenceをもつことしかできない。したがって、複数の薬剤を同一のRp番号で表現する場合にはMedicationAdministrationを繰り返すか、複数の薬剤をまとめたMedication Resouceのインスタンスを参照することとなる。ワーキンググループでの検討の結果、複数の薬剤をまとめたMedicationリソースのインスタンスをcontained属性に内包した上で参照することとした。

### 2.1.2.7.5.2. 投与薬剤、投与量の記述方法
１回の投与薬剤と投与量は、RP内の薬剤が１薬剤の場合も混注などで複数の薬剤を含む場合も、すべての薬剤を記述したMedicationリソースを contained 属性に内包し、それをMedicationRequest.medicationReference属性で参照するようにする。
Medicationリソースのingredient.itemCodeableConcept要素にCodeableConcept型で各薬剤の識別情報を記述し、ingredient.strength.numerator要素に１回あたりの含有量を記述する。薬剤を識別するコードはHOT7("urn:oid:1.2.392.100495.20.2.73")、HOT9("urn:oid:1.2.392.200119.4.403.1")、YJコード("urn:oid:1.2.392.100495.20.1.73")を推奨するが、ローカルコードを使用してもよい。含有量の単位コードは MERIT-9（"urn:oid:1.2.392.100495.20.2.101"）を使用する。ingredient.strength.denominatorには固定値「１回」をMERIT-9（"urn:oid:1.2.392.100495.20.2.101"）を使用して指定する。
dosage.dose要素には、情報が得られる場合には全体の容量をUCUM(`http://unitsofmeasure.org`)を使用してmL単位で指定する。

### 2.1.2.7.5.3. 投薬管理ステータス
投与が実施された場合、status要素に `completed` を記述する。
```json
"status": "completed"
```

投与が中止された場合、status要素に `stopped` を記述する。
```json
"status": "stopped"
```

### 2.1.2.7.5.4. 実施日
投与が実施された日時をeffectiveDateTime、またはeffectivePeriod要素に[RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)形式で記述する。
タイムゾーンはJST(+09:00)を指定する。

開始日時、終了日時が明確である場合はeffectivePeriodに記述する。（e.g. 点滴注射）
```json
"effectivePeriod": {
  "start": "2016-07-01T08:05:21+09:00",
  "end": "2016-07-01T13:05:43+09:00"
}
```
開始日時しか存在せず終了日時が明確でない場合、effectivePeriodのstartとendに同じ値を記述するか、effectiveDateTime要素に記述する。（e.g. ワンショット注射）
```json
"effectiveDateTime": "2016-08-25T08:30:00+09:00"
```

### 2.1.2.7.5.5. 実施者
投与を実施した医療従事者（自己管理の場合は患者）をperformer要素に記述する。

performer.functionには、FHIR標準のValueSetである `http://hl7.org/fhir/ValueSet/med-admin-perform-function` から、実施者を表す `performer` を固定で記述する。
performer.actorには、医療従事者(Practitioner)、または患者(Patient)リソースの参照を記述する。
```json
"performer": {
  "function": {
    "coding": [
      {
        "system": "http://hl7.org/fhir/ValueSet/med-admin-perform-function",
        "code": "performer",
        "display": "Performer"
      }
    ]
  },
  "actor": {
    "reference": "Practitioner/1"
  }
}
```

### 2.1.2.7.5.6. 実施場所
投与を実施した場所（病棟、病室、ベッド番号など）を、拡張「JP_MedicationAdministration_Location」を使用して、Reference型でLocationリソースの参照情報を記述する。
(Location Resourceの記述仕様については、当プロファイルのスコープ外とする)
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location",
      "valueReference": {
        "reference": "Location/1"
      }
    }
  ]
}
```

### 2.1.2.7.5.7. 実施投与ライン
投与時に使用したラインを記述する場合は、dosage要素で拡張「JP_MedicationRequest_DosageInstruction_Line」を使用し、CodeableConcept型で指定する。推奨するコードシステムはないので、ローカルコードを使用する。

```json
"dosage": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://hl7fhir.jp/medication/99ILL",
            "code": "01",
            "display": "主管"
          }
        ]
      }
    }
  ]
}
```

### 2.1.2.7.5.8. 実施投与経路
「1:内服」、「2:外用」などJAMI標準用法コードにて基本用法区分として表現される区分は、dosage.route 要素にコードまたは文字列で指定する。基本用法区分を識別するURIとして、"urn:oid:1.2.392.200250.2.2.20.30"を使用する。

```json
"dosage": {
  "route": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0162",
        "code": "IV",
        "display": "静脈内"
      }
    ]
  }
}
```

### 2.1.2.7.5.9. 実施投与部位
投与部位を指定する場合は、dosage.site 要素に、CodeableConcept型で指定する。部位コードは、JAMI標準用法コード 表13 外用部位コード（"urn:oid:1.2.392.100495.20.2.33"）を推奨する。
HL7表0550 身体部位("http://terminology.hl7.org/CodeSystem/v2-0550")とHL7表0495 身体部位修飾子("http://terminology.hl7.org/CodeSystem/v2-0495")を組み合わせて使用してもよいが、その場合は拡張「BodyStructure」を使用する。
この拡張は BodyStructureリソースを参照することができるので、location 要素にHL7表0550 身体部位("http://terminology.hl7.org/CodeSystem/v2-0550")のコードを、locationQualifier 要素に
身体部位修飾子("http://terminology.hl7.org/CodeSystem/v2-0495")のコードをそれぞれ指定したBodyStructureリソースをMedicationRequestリソースのcontained属性に内包し、それをExtension.valueRefenrence 要素で参照するようにする。

投与部位「左腕」をJAMI標準用法コードで指定した場合のインスタンス例を示す。

```json
"dosage": [
  {
    "site": {
      "coding": [
        {
          "system": "urn:oid:1.2.392.100495.20.2.33",
          "code": "73L",
          "display": "左腕"
        }
      ]
    },

```

投与部位「左腕」をHL7表0550 身体部位とHL7表0495 身体部位修飾子で指定した場合のインスタンス例を示す。

```json
"contained": [
  {
    "resourceType": "BodyStructure",
    "id": "#site",
    "location": {
      "coding": [
        {
          "system": "http://terminology.hl7.org/CodeSystem/v2-0550",
          "code": "ARM",
          "display": "腕"
        }
      ]
    },
    "locationQualifier": [
      {
        "coding": [
          {
            "system": "http://terminology.hl7.org/CodeSystem/v2-0495",
            "code": "L",
            "display": "左"
          }
        ]
      }
    ]
  }
],
"dosage": [
  {
    "site": {
      "extension": [
        {
          "url": "http://hl7.org/fhir/core/StructureDefinition/bodySite",
          "valueReference": "#site"
        }
      ]
    }
  }
]
```

### 2.1.2.7.5.10. 実施投与手技
「A:貼付」、「B:塗布」などJAMI標準用法コードにて用法詳細区分として表現される区分は、dosage.method 要素にコードまたは文字列で指定する。 用法詳細区分を識別するURIとして、"urn:oid:1.2.392.200250.2.2.20.40"を使用する。

```json
"dosage": {
  "method": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0165",
        "code": "IVP",
        "display": "IVプッシュ"
      }
    ]
  }
}
```

### 2.1.2.7.5.11. 実施投与量
Medication.ingredientに記述される薬剤の合計容量(mL)を dosage.dose に、SimpleQuantity型で記録する。単位コードには、医薬品単位略号（urn:oid:1.2.392.100495.20.2.101）を使用する。

以下薬剤を混注した際の合計容量「510mL」を記述したインスタンス例を示す。
```
ソリタ－Ｔ３号輸液５００ｍＬ ... 1本
アドナ注（静脈用）５０ｍｇ／１０ｍＬ ... 1アンプル
```
=> **510mL** (500mL + 10mL) をdosage.doseに記述する。

```json
"dosage": {
  "dose": {
    "value": 510,
    "unit": "mL",
    "system": "http://unitsofmeasure.org",
    "code": "mL"
  }
}
```

### 2.1.2.7.5.12. 投与速度
点滴注射など一定の速度で時間をかけて投与する場合、その投与速度は dosageInstruction.doseAndRate.rateRatioを使用してRatio型で表現する。単位コードには、UCUM(`http://unitsofmeasure.org`)を使用する。

投与速度「100mL/h」を記述したインスタンス例を示す。

```json
"dosage": {
  "rateRatio": {
    "numerator": {
      "value": 100,
      "unit": "mL",
      "system": "http://unitsofmeasure.org",
      "code": "mL"
    },
    "denominator": {
      "value": 1,
      "unit": "h",
      "system": "http://unitsofmeasure.org",
      "code": "h"
    }
  }
}
```

### 2.1.2.7.5.13. 各種実施コメント

#### 2.1.2.7.5.13.1. 投与経路コメント
投与経路を補足するためのコメントは、route要素に対して定義した拡張「JP_MedicationAdministration_Route_RouteComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

投与経路コメントをString型で記述したインスタンス例を示す。
```json
"route": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Route_RouteComment",
      "valueString": "【仮】投与経路コメントを記述する"
    }
  ],
  "coding": [
    {
      "system": "http://terminology.hl7.org/CodeSystem/v2-0162",
      "code": "IV",
      "display": "静脈内"
    }
  ]
}
```

#### 2.1.2.7.5.13.2. 投与部位コメント
投与部位を補足するためのコメントは、site要素に対して定義した拡張「JP_MedicationAdministration_Site_SiteComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

投与部位コメントをString型で記述したインスタンス例を示す。

```json
"site": {
  "extension": [
    {
      "url": "http://hl7.org/fhir/core/StructureDefinition/bodySite",
      "valueReference": {
        "reference": "BodyStructure/1",
        "display": "右腕"
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Site_SiteComment",
      "valueString": "左利きのため"
    }
  ]
}
```

#### 2.1.2.7.5.13.3. 手技コメント
手技を補足するためのコメントは、method要素に対して定義した拡張「JP_MedicationAdministration_Method_MethodComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

手技コメントをString型で記述したインスタンス例を示す。

```json
"method": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Method_MethodComment",
      "valueString": "１分ほどかけて緩徐に行いました"
    }
  ],
  "coding": [
    {
      "system": "http://hl7fhir.jp/99ILL",
      "code": "101",
      "display": "静注(末梢)"
    }
  ]
}
```

#### 2.1.2.7.5.13.4. ラインコメント
ラインを補足するためのコメントは、dosage要素に対して定義した拡張「JP_MedicationAdministration_Dosage_LineComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

ラインコメントをString型で記述したインスタンス例を示す。

```json
"dosage": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://hl7fhir.jp/medication/99ILL",
            "code": "01",
            "display": "主管"
          }
        ]
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_LineComment",
      "valueString": "【仮】ラインコメントを記述する"
    }
  ]
}
```

#### 2.1.2.7.5.13.5. 投与速度コメント
投与速度を補足するためのコメントは、rate要素に対して定義した拡張「JP_MedicationAdministration_Rate_RateComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

投与速度コメントをString型で記述したインスタンス例を示す。

```json
"rateRatio": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Rate_RateComment",
      "valueString": "倍速で実施"
    }
  ],
  "numerator": {
    "value": 102,
    "unit": "mL",
    "system": "http://unitsofmeasure.org",
    "code": "mL"
  },
  "denominator": {
    "value": 1,
    "unit": "h",
    "system": "http://unitsofmeasure.org",
    "code": "h"
  }
}
```

#### 2.1.2.7.5.13.6. 用法コメント
用法を補足するためのコメントは、dosage要素に対して定義した拡張「JP_MedicationAdministration_Dosage_DosageComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

用法コメントをString型で記述したインスタンス例を示す。

```json
"dosage": {
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Dosage_DosageComment",
      "valueString": "痙攣が発生したため、主治医に確認の上実施しました"
    }
  ]
}
```

#### 2.1.2.7.5.13.7. 進捗コメント
進捗を補足するためのコメントは、reasonCode要素を使用してCodeableConcept型でテキストによる記述とコードによる記述のどちらかを選択することができる。

進捗コメントをテキストで記述したインスタンス例を示す

```json
"reasonCode": {
  "text": "容体急変のため倍の速度で実施"
}
```

#### 2.1.2.7.5.13.8. 未分類コメント
上記のコメントに分類できない、またはシステム的に分類して管理されていない場合、MedicationAdminstrationに対して定義した拡張「JP_MedicationAdministration_UncategorizedComment」を使用する。
この拡張は、コメントがコード化されている場合はCodeableConcept型を使用して記述する。コード化されていない場合はString型を使用して記述する。
複数のコメントを記述する場合は、この拡張を繰り返して記述する。

未分類コメントをString型で記述したインスタンス例を示す。
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_UncategorizedComment",
      "valueString": "１分ほどかけて緩徐に行いました"
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_UncategorizedComment",
      "valueString": "痙攣が発生したため、主治医に確認の上実施しました"
    }
  ]
}
```

### 2.1.2.7.5.14. 投薬依頼情報
実施の元となった投薬依頼(MedicationRequest)リソースの参照を記述する。
```json
"request": {
  "reference": "MedicationRequest/1"
}
```

### 2.1.2.7.5.15. 依頼科
投薬依頼を行なった診療科を、拡張「JP_MedicationAdministration_RequestDepartment」を使用して、CodeableConcept型で記述する。
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment",
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "ttp://terminology.hl7.org/CodeSystem/v2-0069",
            "code": "801",
            "display": "肝胆外科"
          }
        ]
      }
    }
  ]
}
```

### 2.1.2.7.5.16. 依頼医師
投薬依頼を行なった医師を、拡張「JP_MedicationAdministration_Requester」を使用して、Reference型でPractitionerリソースの参照情報を記述する。
(Practitioner Resourceの記述仕様については、当プロファイルのスコープ外とする)
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester",
      "valueReference": {
        "reference": "Practitioner/2"
      }
    }
  ]
}
```

### 2.1.2.7.5.17. 依頼日時
投薬依頼を行なった日時を、拡張「JP_MedicationAdministration_RequestAuthoredOn」を使用して、[RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)形式で記述する。
タイムゾーンはJST(+09:00)を指定する。
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn",
      "valueDateTime": "2016-08-20T09:30:00+09:00"
    }
  ]
}
```

## 2.1.2.7.6. その他、参考文献・リンク等
1. HL7, FHIR MedicationRequest Resource, http://hl7.org/fhir/medicationrequest.html
1. 保健医療福祉情報システム工業会, JAHIS 処方データ交換規約 Ver.3.0C, https://www.jahis.jp/standard/detail/id=564
1. 日本医療情報学会MERIT-9研究会, 医療情報交換規約運用指針、MERIT-9 処方オーダver 1.0, http://merit-9.mi.hama-med.ac.jp/jahis/SHOHOU.pdf
1. 保健医療福祉情報システム工業会, JAHISデータ交換規約（共通編）Ver.1.1, https://www.jahis.jp/standard/detail/id=125
1. 保健医療福祉情報システム工業会, JAHIS注射データ交換規約Ver.2.1C, https://www.jahis.jp/standard/detail/id=590
2. Mike Henderson, 日本HL7協会監修、「HL7メッセージ交換」、第2版、インナービジョン社、2013年
3. 厚生労働省、保険医療機関及び保険医療養担当規則、平三〇厚労令二〇・一部改正, https://www.mhlw.go.jp/web/t_doc?dataId=84035000&dataType=0&pageNo=1
4. 一般社団法人医療情報システム開発センター, 医薬品HOT コードマスター, http://www2.medis.or.jp/hcode/
5. 日本医療情報学会、SS-MIX2仕様書・ガイドライン, http://www.jami.jp/jamistd/ssmix2.php
6. 保健医療福祉情報システム工業会, JAHIS電子処方箋実装ガイドVer.1.2, https://www.jahis.jp/standard/detail/id=774
7. 令和２年度厚⽣労働科学特別研究事業「診療情報提供書, 電⼦処⽅箋等の電⼦化医療⽂書の相互運⽤性確保のための標準規格の開発研究」研究班, 電子処方箋HL7 FHIR記述仕様書案, https://std.jpfhir.jp/
