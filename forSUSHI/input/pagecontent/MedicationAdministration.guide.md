# 2.1.2.6. JP Core MedicationAdministration（内服・外用薬剤処方投与実施情報）プロファイル

## 2.1.2.6.1. 概略
<br>

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationAdministration |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreMedicationAdministrationProfile                                   |
| タイトル       | JP Core MedicationAdministration Profile                               |
| ステータス     | アクティブ（2021-08-26）                                   |
| 定義           | このプロファイルはMedicationAdministrationリソースに対して、内服・外用薬剤処方投与実施情報のデータを送受信するための基礎となる制約と拡張を定めたものである。 |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpmedicationadministration |

<br>

このResource/Profileは内服、外用の薬剤処方の投与実施情報を表現する。薬剤処方は指示する項目、使用する用語集、プロセスなどにおいて諸外国と日本では異なっており、日本国内で規格を運用するためにExtensionの追加や用語集の追加・変更を行った。現在、日本での処方関連規格として利用されているJAHIS 処方データ交換規約 Ver 3.0C を参考にした。

薬剤処方のFHIR仕様に関しては、先行事例として令和２年度厚⽣労働科学特別研究事業「診療情報提供書, 電⼦処⽅箋等の電⼦化医療⽂書の相互運⽤性確保のための標準規格の開発研究」研究班で策定された「電子処方箋HL7 FHIR記述仕様書案」（https://std.jpfhir.jp/ ）があるが、その中で院外処方以外でも利用できる仕様については可能な限り取り入れるようにした。ただし、拡張のURLは新たにJP COREの命名規則に基づいて命名している。

### 2.1.2.6.1.1. 背景および想定シナリオ
本プロファイルは、以下のようなユースケースを想定している。

- 電子カルテから特定の患者の処方実施情報を検索する
- SS-MIX2やJAHIS処方データ交換規約に準拠した処方実施メッセージをJSONに変換する

### 2.1.2.6.1.2. スコープ
#### 2.1.2.6.1.2.1. 対象
このProfileの対象は内服、外用の一般的な薬剤処方の投与実施情報を電子的に連携するためのメッセージを記述することである。

#### 2.1.2.6.1.2.2. 対象としないこと
このProfileは内服、外用の薬剤に関するものであり、注射薬剤については対象としない。注射薬剤は、指示の仕方や指示する項目が内服、外用とは大きく異なるため、別のProfileとして記述することとする。

また、このリソースは薬剤の投与実施に関するものであり、指示（オーダー）、調剤や払い出しは対象としない。それぞれ、MedicationRequest、MedicationDispense が対応するリソースである。

## 2.1.2.6.2. 関連するプロファイル
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


## 2.1.2.6.3. リソース定義
[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/JPMedicationAdministration)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/JPMedicationAdministration/$download?format=json)

{{tree:jp-core-draftv1/JPMedicationAdministration}}

### 2.1.2.6.3.1. 必須要素
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

### 2.1.2.6.3.2. Extensions定義
MedicationAdministration リソースで使用される拡張は次の通りである。

#### 2.1.2.6.3.2.1. JP MedicationAdministration独自で追加されたExtension

|拡張|説明|URL|値の型|
|------------|-------------|----------|-----|
|依頼科|依頼科を格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestDepartment|CodeableConcept
|依頼医|依頼医を格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Requester|Reference(Practitioner)
|依頼日時|依頼日時を格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_RequestAuthoredOn|DateTime
|実施場所|実施場所を格納するための拡張|http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministration_Location|Reference(Location)

#### 2.1.2.6.3.2.2. 既存のExtensionの利用

既存のExtensionの利用は特にない。

### 2.1.2.6.3.3. 用語定義
HL7 FHIRの基底規格では、薬剤コードをはじめとして、剤形などでSNOMED CTが使われているが、日本ではライセンスの問題もあり普及していない。代替としてJAHIS処方データ交換規約やSS-MIX2で使われている用語集を採用した。

HL7 V2系では用語集を識別するコーディングシステム名(以下、「CS名」）は文字列であったが、FHIRではURIを指定する必要があるため、それぞれにURIを割り当てた。以下に使用する用語集のCS名とURI表記を列記する。

★電子処方箋HL7 FHIR仕様を参照しているがよいか。

|分類|CS名|URI|
|---------|----|---------------------------|
|医薬品|HOT7|urn:oid:1.2.392.200119.4.403.2|
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


### 2.1.2.6.3.4. 制約一覧
MedicationAdministration リソースは、以下の制約を満たさなければならない。
- status : JP Coreでは `completed` or `stopped` に限定される。

### 2.1.2.6.3.5. 項目の追加
MedicationAdministrationリソースでは、依頼元のMedicationRequestリソースをrequest要素にReferenceで参照できるようになっているが、
依頼元のMedicationRequestリソースが取得できないケースも考慮して、依頼情報を直接記述できるように以下の項目を追加した。

* 依頼科の追加（拡張「JP_MedicationAdministration_RequestDepartment」を使用）
* 依頼医の追加（拡張「JP_MedicationAdministration_Requester」を使用）
* 依頼日時の追加（拡張「JP_MedicationAdministration_RequestAuthoredOn」を使用）

また、投薬実施場所（病棟、病室、ベッド番号など）を記述できるように以下の項目を追加した。

* 実施場所の追加（拡張「JP_MedicationAdministration_Location」を使用）

## 2.1.2.6.4. 利用方法

### 2.1.2.6.4.1. Interaction一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                           |
| SHOULD（推奨）   | vread、history-instance                     |
| MAY（利用可能）  | create、update、patch、delete、history-type |

#### 2.1.2.6.4.1.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | identifier    | token  | GET [base]/MedicationAdministration?identifier=http://myhospital.com/fhir/medication\|1234567890 |
| SHOULD            | patient      | reference | GET [base]/MedicationAdministration?patient=123456   |
| SHOULD           | patient,effective-time | referenece,date  | GET [base]/MedicationAdministration?patient=123456&effective-time=eq2013-01-14 |
| MAY           | TBD | TBD | GET [base]/MedicationAdministration?code=urn:oid:1.2.392.100495.20.2.74\|105271807  |

##### 2.1.2.6.4.1.1.1. 必須検索パラメータ

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
   

##### 2.1.2.6.4.1.1.2. 推奨検索パラメータ

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


##### 2.1.2.6.4.1.1.3. 追加検索パラメータ 

#### 2.1.2.6.4.1.2. Operation一覧

JP MedicationAdministration リソースに対して使用される操作は次の通りである。

- $everything：[base]/MedicationAdministration/[id]/$everything

  - この操作が呼び出された特定のMedicationAdministrationに関連する全ての情報を返す。
    

#### 2.1.2.6.4.1.3. Operation 詳細

##### 2.1.2.6.4.1.3.1. $everything 操作

この操作は、この操作が呼び出された特定のMedicationAdministrationリソースに関連する全ての情報を返す。応答は "searchset" タイプのBundleリソースである。サーバは、少なくとも、識別されたMedicationAdministrationコンパートメントに含まれる全てのリソースと、それらから参照されるすべてのリソースを返すことが望ましい。

この操作の公式なURLは以下である。

```http
http://hl7.jp/fhir/OperationDefinition/MedicationAdministration-everything
```

URL: [base]/MedicationAdministration/[id]/$everything

本操作は、べき等な操作である。


###### 2.1.2.6.4.1.3.1.1. 入力パラメータ

| 名前   | 多重度 | 型      | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------- | -------------- | ------------ | ------------------------------------------------------------ |
| start  | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。開始日が指定されていない場合、終了日以前のすべてのレコードが対象に含まれる。 |
| end    | 0..1   | date    |                |              | 特定の日付範囲で提供されたケアに関連する全ての記録を意味する。終了日が指定されていない場合、開始日以降のすべてのレコードが対象に含まれる。 |
| _since | 0..1   | instant |                |              | 指定された日時以降に更新されたリソースのみが応答に含まれる。 |
| _type  | 0..*   | code    |                |              | 応答に含むFHIRリソース型を、カンマ区切りで指定する。指定されない場合は、サーバは全てのリソース型を対象とする。 |
| _count | 0..1   | integer |                |              | Bundleの1ページに含まれるリソース件数を指定。                |

###### 2.1.2.6.4.1.3.1.2. 出力パラメータ

| 名前   | 多重度 | 型     | バインディング | プロファイル | 説明                                                         |
| ------ | ------ | ------ | -------------- | ------------ | ------------------------------------------------------------ |
| return | 1..1   | Bundle |                |              | バンドルのタイプは"searchset"である。この操作の結果は、リソースとして直接返される。 |

###### 2.1.2.6.4.1.3.1.3. 例

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

### 2.1.2.6.4.2. サンプル
[JAHIS処方データ交換規約 Ver.3.0C](https://www.jahis.jp/standard/detail/id=564)の137ページに記載されている下記の処方実施をFHIRで表現する場合について解説する。
```
投与日時　2016/08/25 08:30
Rp1
　ムコダイン錠２５０ｍｇ　　　　　　　　１錠
　パンスポリンＴ錠１００　１００ｍｇ　　０錠（投与中止）
```

| 項目名 | 項目値 | 備考 |
| :--- | :--- | :--- |
| オーダ番号 | 12345678 |
| 依頼日 | 2016/08/25 |
| 依頼医 | 医師 春子(123456) |
| 依頼科 | 内科(01)  |
| 入外区分 | 入院(I) |
| Rp番号 | 01 |
| 薬剤-1 | ムコダイン錠２５０ｍｇ(103835401) |
| 投与量-1 | 1錠 |
| 薬剤-2 | パンスポリンＴ錠１００ １００ｍｇ(110626901) |
| 投与量-2 | 0錠 | ※投与せず
| 投与開始日時 | 2016/08/25 08:30 |
| 投与終了日時 | 2016/08/25 08:30 |
| 投与者 | 看護師 夏子(20001)  |
| 投与場所 | 09A病棟021病室4ベッド |
| 実施更新日時 | 2016/08/25 12:03:43 |

#### 2.1.2.6.4.2.1. ムコダイン錠２５０ｍｇ（実施）
```json
{
  "resourceType": "MedicationAdministration",
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
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministrationRequester",
      "valueReference": {
        "reference": "Practitioner/2",
        "display": "医師 春子"
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministrationRequestAuthoredOn",
      "valueDateTime": "2016-08-25T00:00:00+09:00"
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
      "value": "12345678"
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
  "medicationCodeableConcept": {
    "coding": [
      {
        "system": "urn:oid:1.2.392.100495.20.2.74",
        "code": "103835401",
        "display": "ムコダイン錠２５０ｍｇ"
      }
    ]
  },
  "subject": {
    "reference": "Patient/1"
  },
  "effectiveDateTime": "2016-08-25T08:30:00+09:00",
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
        "display": "看護師 夏子"
      }
    }
  ],
  "request": {
    "reference": "MedicationRequest/1"
  },
  "dosage": {
    "route": {
      "coding": [
        {
          "system": "urn:oid:1.2.392.200250.2.2.20.40",
          "code": "0",
          "display": "経口"
        }
      ]
    },
    "method": {
      "coding": [
        {
          "system": "urn:oid:1.2.392.200250.2.2.20.30",
          "code": "1",
          "display": "内服"
        }
      ]
    },
    "dose": {
      "value": 1,
      "unit": "錠",
      "system": "urn:oid:1.2.392.100495.20.2.101",
      "code": "TAB"
    }
  }        
}
```

#### 2.1.2.6.4.2.2. パンスポリンＴ錠１００ １００ｍｇ（中止）
```json
{
  "resourceType": "MedicationAdministration",
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
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministrationRequester",
      "valueReference": {
        "reference": "Practitioner/2",
        "display": "医師 春子"
      }
    },
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministrationRequestAuthoredOn",
      "valueDateTime": "2016-08-25T00:00:00+09:00"
    }
  ],
  "identifier": [
    {
      "system": "http://www.example.com/fhir/order-number",
      "value": "12345678"
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
  "status": "stopped",
  "category": {
    "coding": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v2-0482",
        "code": "I",
        "display": "入院オーダ"
      }
    ]
  },
  "medicationCodeableConcept": {
    "coding": [
      {
        "system": "urn:oid:1.2.392.100495.20.2.74",
        "code": "110626901",
        "display": "パンスポリンＴ錠１００ １００ｍｇ"
      }
    ]
  },
  "subject": {
    "reference": "Patient/1"
  },
  "effectiveDateTime": "2016-08-25T08:30:00+09:00",
  "request": {
    "reference": "MedicationRequest/2"
  }        
}
```

## 2.1.2.6.5. 注意事項

### 2.1.2.6.5.1. 記述の単位について
MedicationAdministrationは薬剤をCodeableConceptとして1つまでしか持つか、Medication Resourceのreferenceをもつことしかできない。
したがって、複数の薬剤を同一のRp番号で表現する場合にはMedicationAdministrationを繰り返すか、複数の薬剤をまとめたMedication Resouceのインスタンスを参照することとなる。
ワーキンググループでの検討の結果、冗長とはなるがidentifierにRp番号と薬剤番号を記録することとし、MedicationAdministrationを繰り返すことで表現する方法を推奨することとした。

基本的にはMedicationRequestに対応したMedicationAdministrationインスタンスを生成する。
ただし、内服薬剤処方のMedicationRequestは複数回、複数日の服薬タイミングをまとめて1つのインスタンスで記述するが、MedicationAdministrationは1回の服薬単位の粒度でインスタンスを生成する必要がある。
例えば、MedicationRequestの用法、投与日数が「１日３回 朝昼夕食後　１４日分」の場合、3 x 14 = 42 (x 薬剤数) の処方実施情報インスタンスが生成される。

### 2.1.2.6.5.2. 投与実施の記述方法

### 2.1.2.6.5.3. 投薬管理ステータス
投与が実施された場合、status要素に `completed` を記述する。
```json
"status": "completed"
```

### 2.1.2.6.5.4. 実施日
投与が実施された日時をeffectiveDateTime or effectivePeriod要素に[RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)形式で記述する。
タイムゾーンはJST(+09:00)を指定する。

開始日時、終了日時が明確である場合はeffectivePeriodに記述する。
```json
"effectivePeriod": {
  "start": "2016-07-01T08:05:21+09:00",
  "end": "2016-07-01T13:05:43+09:00"
}
```
開始日時しか存在せず終了日時が明確でない場合、effectivePeriodのstartとendに同じ値を記述するか、effectiveDateTime要素に記述する。
```json
"effectiveDateTime": "2016-08-25T08:30:00+09:00"
```

### 2.1.2.6.5.5. 実施者
投与を実施した医療従事者（自己管理の場合は患者）をperformer要素に記述する。

performer.functionには、FHIR標準のValueSetである `http://hl7.org/fhir/ValueSet/med-admin-perform-function` から、実施者を表す `performer` を固定で記述する。
performer.actorには、医療従事者(Practitioner)、または患者(Patient)リソースの参照を記述する。
```json
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
      "display": "看護師 夏子"
    }
  }
]
```

### 2.1.2.6.5.6. 実施場所
投与を実施した場所（病棟、病室、ベッド番号など）を、拡張「JP_MedicationAdministrationLocation」を使用して、Reference型でLocationリソースの参照情報を記述する。
(Location Resourceの記述仕様については、当プロファイルのスコープ外とする)
```json
"extension": [
  {
    "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministrationLocation",
    "valueReference": {
      "reference": "Location/1"
    }
  }
]
```

###　 実施情報
「1:内服」、「2:外用」などJAMI標準用法コードにて基本用法区分として表現される区分は、dosage.route 要素にコードまたは文字列で指定する。基本用法区分を識別するURIとして、"urn:oid:1.2.392.200250.2.2.20.30"を使用する。

「A:貼付」、「B:塗布」などJAMI標準用法コードにて用法詳細区分として表現される区分は、dosage.method 要素にコードまたは文字列で指定する。 用法詳細区分を識別するURIとして、"urn:oid:1.2.392.200250.2.2.20.40"を使用する。

投与量は dosage.dose に、SimpleQuantity型で記録する。単位コードには、医薬品単位略号（urn:oid:1.2.392.100495.20.2.101）を使用する。

```json
"dosage": {
  "route": {
    "coding": [
      {
        "system": "urn:oid:1.2.392.200250.2.2.20.40",
        "code": "0",
        "display": "経口"
      }
    ]
  },
  "method": {
    "coding": [
      {
        "system": "urn:oid:1.2.392.200250.2.2.20.30",
        "code": "1",
        "display": "内服"
      }
    ]
  },
  "dose": {
    "value": 1,
    "unit": "錠",
    "system": "urn:oid:1.2.392.100495.20.2.101",
    "code": "TAB"
  }
}
```

### 2.1.2.6.5.7. 投薬依頼情報
実施の元となった投薬依頼(MedicationRequest)リソースの参照を記述する。
```json
"request": {
  "reference": "MedicationRequest/1"
}
```

### 2.1.2.6.5.8. 依頼科
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
            "system": "urn:oid:1.2.392.100495.20.2.51",
            "code": "801",
            "display": "肝胆外科"
          }
        ]
      }
    }
  ]
}
```

### 2.1.2.6.5.9. 依頼医師
投薬依頼を行なった医師を、拡張「JP_MedicationAdministrationRequester」を使用して、Reference型でPractitionerリソースの参照情報を記述する。
(Practitioner Resourceの記述仕様については、当プロファイルのスコープ外とする)
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministrationRequester",
      "valueReference": {
        "reference": "Practitioner/2"
      }
    }
  ]
}
```

### 2.1.2.6.5.10. 依頼日時
投薬依頼を行なった日時を、拡張「JP_MedicationAdministrationRequestAuthoredOn」を使用して、[RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)形式で記述する。
タイムゾーンはJST(+09:00)を指定する。
```json
{
  "resourceType": "MedicationAdministration",
  "extension": [
    {
      "url": "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationAdministrationRequestAuthoredOn",
      "valueDateTime": "2016-08-20T09:30:00+09:00"
    }
  ]
}
```

### 2.1.2.6.5.11. 投与中止の記述方法

### 2.1.2.6.5.12. 投薬管理ステータス
投与が中止された場合、status要素に `stopped` を記述する。
```json
"status": "stopped"
```

### 2.1.2.6.5.13. 実施日
投与を実施する予定であった日時をeffectiveDateTime要素に[RFC3339](https://datatracker.ietf.org/doc/html/rfc3339)形式で記述する。
タイムゾーンはJST(+09:00)を指定する。
```json
"effectiveDateTime": "2016-08-25T08:30:00+09:00"
```

### 2.1.2.6.5.14. 投薬依頼情報
投与実施と同様

## 2.1.2.6.6. その他、参考文献・リンク等
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

