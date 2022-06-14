# 1.3. 欠損値（データが存在しない場合）の扱い
---
FHIR®では[JSON](https://www.hl7.org/fhir/json.html#2.6.2)および[XML](https://www.hl7.org/fhir/xml.html)いずれにおいてもオブジェクトは空ではならない。リソース内にエレメントが存在している場合、そのエレメントはそのタイプに応じた何らかのプロパティか1つ以上の拡張を持つ必要がある（[2.6.2 JSON Representation of Resources](https://www.hl7.org/fhir/json.html#:~:text=Objects%20are%20never%20empty), [2.6.1 XML Representation of Resources](https://www.hl7.org/fhir/xml.html#:~:text=FHIR%20elements%20are%20never%20empty)）。string型の値は空文字列であってはならず、そのプロパティが存在するのであれば、1字以上の文字を含む必要がある（[2.24.0.1 Primitive Types](https://www.hl7.org/fhir/datatypes.html#:~:text=strings%20SHOULD%20always%20contain%20non-whitespace)）。

データがない場合に、[Data Absent Reason拡張](https://www.hl7.org/fhir/extension-data-absent-reason.html)を用いて、データが欠損している理由を表すことができる。

JP Core の検索要求するクライアント(Requester)およびサーバ(Responder)は以下の要求を満たすこと **(SHALL)**
## 1.3.1. クライアント(Requster)
---
### 1.3.1.1. Must SupportおよびCardinalityが１以上が付与された要素を含むリソースを受信した場合、エラーを発生させたりアプリケーションを失敗させることなく、それらの値を処理することができなければならない **(SHALL)**。

 **例)**
Readインタラクションの応答として、Must SupportおよびCardinalityが１以上の 要素であるPatient.maritalStatus を含むPatient リソースを受信した場合、
要求者はその値をエラーなく処理しなければならない。

```
 {
    "resourceType" : "Patient",
    ...
    "maritalStatus"　:　{
        "coding": [{
            "system": "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus",
            "code": "M",
            "display": "Married"
        }]
    },
    ...
}, 
```

### 1.3.1.2. 実装ガイドに準拠する要求者は、欠損データであることを宣言した Must SupportおよびCardinalityが１以上の データ要素を含むリソースインスタンスを処理できなければならない **(SHALL)**。
 **例)**
Patient.birthDateの値に欠損情報が付与されているリソースを、要求者は処理できなければならない。なお、birthDateはdate型というprimitive typeであり、そのextensionは"_"を先頭につけたプロパティに対して設定される([2.6.2.3 JSON representation of primitive elements](https://www.hl7.org/fhir/json.html#primitive))。

```
{
    "resourceType " : "Patient",
    ...
    "_birthDate ": {
        "extension" : [{
            "url " : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
        }]
    },
    ...
} 
```

## 1.3.2. サーバ(Responder)
---
### 1.3.2.1. Must SupportおよびCardinalityが１以上の 要素の値を保持している場合
JP Core 実装ガイドに準拠する応答者は、Must SupportおよびCardinalityが１以上のが付与された要素について、当該要素の値を保持している場合には、要求された検索結果のリソースのデータ要素として含めることができなければならない。 **(SHALL)**

### 1.3.2.2. Must SupportおよびCardinalityが１以上の 要素の値を保持していない場合
Must SupportおよびCardinalityが１以上の要素がオプショナルな要素の場合Responderは、そのデータ要素の項目を省略してもよい。 **(MAY)**

 **例)**
```
Patient.telecomが欠損している場合…telecom要素は含まなくてよい
{
    "resourceType" : "Patient",
    ...
    "name" : [{"family" : "Yamada", "given" : [ "Taro" ] }],
    "gender" : "male",
    ...
}
```

#### 1.3.2.2.1. Must SupportおよびCardinalityが１以上の 要素が必須要素の場合
JP Core実装ガイドの応答者は、リソースに含めるべき必須 MustSupport要素の値を保持していない場合は、次のように、データの欠損理由を指定しなければならない。 **(SHALL)** もし、そのデータの欠損理由を応答者が正確に把握していない状況では、その値を含めてはならない。 **(SHALL NOT)**

##### 1.3.2.2.1.1. 非コード化要素の場合
非コード化値の場合： Data Absent Reason拡張を使用して、欠損理由を送
信できなければならない。 **(SHALL)** 

 **例)**
患者の生年月日が不明なため、Patient.birthDateに値を保持していない場合（Patient.birthDateが必須 MustSupport）、Data Absent Reason 拡張を使用して、欠損理由（＝不明）を示す。なお、birthDateはdate型というprimitive typeであり、そのextensionは"_"を先頭につけたプロパティに対して設定される([2.6.2.3 JSON representation of primitive elements](https://www.hl7.org/fhir/json.html#primitive))。

```
{
    "resourceType " : "Patient",
    ...
    "_birthDate ": {
        "extension" : [{
            "url " : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
        }]
    },
    ...
} 
```
##### 1.3.2.2.1.2. コード化データ要素の場合
###### 1.3.2.2.1.2.1. そのコード化要素が、CodeableConceptデータ型で、バインディング強度が、example, preferred, extensible のいずれかの場合

###### 1.3.2.2.1.2.2. コード化値の代替となる文字情報を持っている場合は、文字データのみを使用する

 **例)**
 Patient.maritalStatus が必須要素の場合で、Patient.maritalStatus のコード値はわからないが、「既婚」という文字情報は持っている場合、CodeableConcept の text を使用する。

```
{
    "resourceType" : "Patient",
    ...
    "maritalStatus": {
        "text" : "既婚"
    },
    ...
}
```

###### 1.3.2.2.1.2.3. コード化値の代替となる文字情報を持っていない場合はバリューセットの中に、例外値を表現するコードがある場合その値を使用する

 **例)**バリューセットに含まれる例外値を表現するコードを使用（ValueSet marital-statusには、不明な状態を表すコード[UNK]を含んでいるため、UNKを使用する）
```
{
    "resourceType" : "Patient",
    ...
    "maritalStatus": {
        "coding": [{
            "system":"http://terminology.hl7.org/CodeSystem/v3-NullFlavor",
            "code": "UNK",
            "display": "unknown"
        }]
    },
    …
}
```

###### 1.3.2.2.1.2.4. バリューセットの中に、例外値を表現するコードが無い場合[DataAbsentReason]コード体系から、適切な概念コードを使用する。
**例)** Patient.communication.language が必須MustSupport要素で、その値が、患者に確認していないため不明の場合、Data Absent Reason拡張より「not-asked」を使用する。※Patient.communication.language は現状のJP Core Patientプロファイル案では必須ではないため、例示のためのみに使用した。

```
{
    "resourceType" : "Patient",
    ...
    "communication": [{
        "language":{
            "extension": [{
                    "url " : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
                    "valueCode" : "not-asked",
                    "display": "Not asked"
            }]
        }
    }],
    ...
}
```


###### 1.3.2.2.1.2.5. そのコード化要素が、CodeableConceptデータ型、または、code データ型で、バインディング強度が required の場合そのバリューセット内に含まれる例外値を表すコードを使用する。
 **例)** Patient.gender が必須 MustSupport要素の場合で、その値が不明の場合、 バリューセットAdministrativeGender に含まれる例外値を表すコード「unknown」を使用する。※Patient.genderは現状のJP Core Patientプロファイル案では必須ではないため、例示のために使用した。

```
{
    "resourceType" : "Patient",
    ...
    "gender": "unknown",
    …
}
```
