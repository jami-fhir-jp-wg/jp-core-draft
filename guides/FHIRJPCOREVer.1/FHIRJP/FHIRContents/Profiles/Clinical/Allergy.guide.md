# 2.1.4.1. JP Core AllergyIntolerance （アレルギー・不耐症） プロファイル

## 2.1.4.1.1. 概略

本プロファイルは、患者のアレルギーや不耐症とその臨床的な評価を表現する`AllergyIntolerance`リソースの記録・更新・検索を行う上で、準拠するべき必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL     | http://jpfhir.jp/fhir/core/StructureDefinition/JP_AllergyIntolerance |
| バージョン    | 1.0.0                              |
| 名前        | JPCoreAllergyIntoleranceProfile |  
| タイトル      | JP Core AllergyIntolerance Profile |
| ステータス    | Active （2021-11-24） |
| 定義        | 本プロファイルは`AllergyIntolerance`リソースに対して、患者のアレルギーや不耐症に関するデータを送受信するための基礎となる制約と拡張を定めたものである。|
| 公開者      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright  | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpallergyintolerance |

### 2.1.4.1.1.1. スコープ

- `AllergyIntolerance`リソースは患者のアレルギーや不耐症を表現する。具体的には、特定の物質または物質群への将来の暴露に対して有害反応を起こす傾向、または患者に対する潜在的なリスクを表現する。
- アレルギー又は不耐症の対象物質は、医薬品（適切な用量で正しく投与された場合）、化学物質、食べ物、植物や動物に由来する物質、または昆虫刺傷からの毒などである。

### 2.1.4.1.1.2. 想定シナリオ

本プロファイルは、以下のようなユースケースを想定する。

- `AllergyIntolerance`リソースの記録・更新・検索。
- 他リソースからの参照（例：`AdverseEvent`, `FamilyMemberHistory`）

## 2.1.4.1.2. 関連するプロファイル
本プロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

- [`AdverseEvent`](https://www.hl7.org/fhir/adverseevent.html)
- [`ClinicalImpression`](https://www.hl7.org/fhir/clinicalimpression.html)
- [`FamilyMemberHistory`](https://www.hl7.org/fhir/familymemberhistory.html)
- ...（その他多数）

## 2.1.4.1.3. リソース定義

[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpallergyintolerance)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpallergyintolerance/$download?format=json)

{{tree:jp-core-draftv1/jpallergyintolerance}}


### 2.1.4.1.3.1. 必須要素

本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- `code` : アレルギーまたは不耐性の種類を示すコード。
- `patient` : 本リソースを有する患者。

### 2.1.4.1.3.2. Extensions定義

- Extensions定義はない

### 2.1.4.1.3.3. 用語定義


| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
|`AllergyIntolerance.clinicalStatus`| このアレルギー・不耐性の臨床的なステータス。 | Required          | active, inactive, resolved </br> http://hl7.org/fhir/ValueSet/allergyintolerance-clinical |
|`AllergyIntolerance.verificationStatus`| 特定された物質（医薬品を含む）に対する反応の傾向や潜在的なリスクに関連する確実性。 | Required | unconfirmed, confirmed, refuted, entered-in-error </br> http://hl7.org/fhir/ValueSet/allergyintolerance-verification |
|`AllergyIntolerance.type`| 副作用リスクの原因にある生理学的メカニズムの種類 | Required | allergy, intolerance </br> http://hl7.org/fhir/ValueSet/allergy-intolerance-type |
|`AllergyIntolerance.category`| 特定された原因物質のカテゴリ | Required |  jp_food, jp_medication, jp_environment_others </br> http://jpfhir.jp/fhir/CodeSystem/*** (予定)| 
|`AllergyIntolerance.criticality`| 特定されたアレルギー物質に対する反応の、潜在的な臨床的危害または深刻さの推定 | Required | low, high, unable-to-assess </br> http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality |
|`AllergyIntolerance.code`| アレルゲンのコード | Example | <a href="https://docs.google.com/spreadsheets/d/1BhL5XbaxycmGLRHzh-kdTvOrdPJ8-SZPOYvrOiL1pLE/edit#gid=1994452004" target="_blank"> JPCoreアレルギー用語（JFAGY） </a> </br> http://jpfhir.jp/fhir/CodeSystem/*** (予定)|
|`AllergyIntolerance.reaction.substance`| アレルギー不耐症の原因と考えられた特定の物質（医薬品を含む）の識別情報 | Example | 未定 | 
|`AllergyIntolerance.reaction.manifestation`| 有害事象イベントにおいて観測される、または関連する臨床症状および/または兆候 |Example | 未定 |
|`AllergyIntolerance.reaction.severity`|有害事象イベントの重症度の臨床評価 | Required | mild, moderate, seevere </br> http://hl7.org/fhir/ValueSet/reaction-event-severity |
|`AllergyIntolerance.reaction.exposureRoute`| 被験者が物質にさらされた経路の説明 | Example | 未定 <a href="https://docs.google.com/spreadsheets/d/1ry7_dtM4CS_dh6BC7AGRUPm8SKrswnkBfuh8uu1MspQ/edit#gid=0" target="_blank"> （参考用：SNOMEDの和訳） </a> </br> http://jpfhir.jp/fhir/CodeSystem/*** (予定)　 |

### 2.1.4.1.3.4. 制約一覧

- 制約はない

## 2.1.4.1.4. 利用方法

### 2.1.4.1.4.1. インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                        |
| SHOULD（推奨）   | vread、history-instance                  |
| MAY（利用可能）  | create、update、patch、delete、history-type |

### 2.1.4.1.4.2. OperationおよびSearch Parameter 一覧
#### 2.1.4.1.4.2.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | patient    | reference  | GET [base]/AllergyIntolerance?patient=123456 |
| SHALL            | patient,date | reference,date | GET [base]/AllergyIntolerance?patient=123456&date=ge2021-08-24 |
| SHOULD           | patient,clinicalstatus | reference,code | GET [base]/AllergyIntolerance?patient=123456&clinicalstatus=active |
| SHOULD           | patient,verificationstatus | reference,code | GET [base]/AllergyIntolerance?patient=123456&verificationstatus=confirmed |
| SHOULD           | patient,type | reference,code | GET [base]/AllergyIntolerance?patient=123456&type=allergy |
| SHOULD           | patient,category | reference,code | GET [base]/AllergyIntolerance?patient=123456&category=jp_food |
| SHOULD           | patient,criticality | reference,code | GET [base]/AllergyIntolerance?patient=123456&criticality=high |

##### 2.1.4.1.4.2.1.1. 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）。

1. 検索パラメータ`patient`を指定し、該当するすべての`AllergyIntolerance`を検索。

   ```http
   GET [base]/AllergyIntolerance?patient={Type/}[id]

   ```
   例：

   ```http
   GET [base]/AllergyIntolerance?patient=123456
   ```

   指定された患者のすべての`AllergyIntolerance`を含むBundleを返却する。

2. 検索パラメータ`patient`と`date`の組みを指定し、該当するすべての`AllergyIntolerance`を検索。

  * `date`に対する次の比較演算子のサポートを含む: gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)
    ```http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    ```

    例：

    ```http
    GET [base]/AllergyIntolerance?patinet=123456&date=ge2021-08-24
    ```

    指定された患者および日付のすべての`AllergyIntolerance`を含むBundleを返却する。


##### 2.1.4.1.4.2.1.2. 推奨検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートすることが推奨（SHOULD）される。

1. 検索パラメータ`patient`と`clinicalstatus`の組みを指定し、該当するすべての`AllergyIntolerance`を検索。
  * OR検索のサポートを含む(例えば clinicalstatus={system|}[code],{system|}[code],...)

    ```http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&clinicalstatus={system|}[code]{,{system|}[code],...}
    ```

    例：

    ```http
    GET [base]/AllergyIntolerance?patient=123456&clinicalstatus=active
    ```

    ```http
    GET [base]/AllergyIntolerance?patient=123456&clinicalstatus=http://hl7.org/fhir/ValueSet/allergyintoleranceclinical|active
    ```

    指定された患者およびステータスのすべての`AllergyIntolerance`を含むBundleを返却する。

2. 検索パラメータ`patient`と`verificationstatus`組みを指定し、該当するすべての`AllergyIntolerance`を検索。
  * OR検索のサポートを含む(例えば verificationstatus={system|}[code],{system|}[code],...)

    ```http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&verificationstatus={system|}[code]{,{system|}[code],...}
    ```

    例：

    ```http
    GET [base]/AllergyIntolerance?patient=123456&verificationstatus=confirmed
    ```

    ```http
    GET [base]/AllergyIntolerance?patient=123456&verificationstatus=http://hl7.org/fhir/ValueSet/allergyintoleranceverification|confirmed
    ```

    指定された患者およびステータスのすべての`AllergyIntolerance`を含むBundleを返却する。

3. 検索パラメータ`patient`と`type`組みを指定し、該当するすべての`AllergyIntolerance`を検索。
  * OR検索のサポートを含む(例えば type={system|}[code],{system|}[code],...)

    ```http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&type={system|}[code]{,{system|}[code],...}
    ```

    例：

    ```http
    GET [base]/AllergyIntolerance?patient=123456&type=allergy
    ```

    ```http
    GET [base]/AllergyIntolerance?patient=123456&category=http://hl7.org/fhir/ValueSet/allergy-intolerance-type|allergy
    ```

    指定された患者およびステータスのすべての`AllergyIntolerance`を含むBundleを返却する。

4. 検索パラメータ`patient`と`category`組みを指定し、該当するすべての`AllergyIntolerance`を検索。
  * OR検索のサポートを含む(例えば category={system|}[code],{system|}[code],...)

    ```http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&category={system|}[code]{,{system|}[code],...}
    ```

    例：

    ```http
    GET [base]/AllergyIntolerance?patient=123456&category=jp_food
    ```

    ```http
    GET [base]/AllergyIntolerance?patient=123456&category=http://jpfhir.jp/fhir/CodeSystem/***|jp_food
    ```

    指定された患者およびステータスのすべての`AllergyIntolerance`を含むBundleを返却する。

5. 検索パラメータ`patient`と`criticality`組みを指定し、該当するすべての`AllergyIntolerance`を検索。
  * OR検索のサポートを含む(例えば criticality={system|}[code],{system|}[code],...)

    ```http
    GET [base]/AllergyIntolerance?patient={Type/}[id]&criticality={system|}[code]{,{system|}[code],...}
    ```

    例：

    ```http
    GET [base]/AllergyIntolerance?patient=123456&criticality=high
    ```

    ```http
    GET [base]/AllergyIntolerance?patient=123456&criticality=http://hl7.org/fhir/ValueSet/allergy-intolerance-criticality|high
    ```

    指定された患者およびステータスのすべての`AllergyIntolerance`を含むBundleを返却する。

##### 2.1.4.1.4.2.1.3. オプション検索パラメータ 

- オプション検索パラメータはない

#### 2.1.4.1.4.2.2. Operation一覧

- Operation一覧はない

### 2.1.4.1.4.3. サンプル

```JSON
{
  "resourceType" : "AllergyIntolerance",
  "id" : "example",
  "text" : {
    "status" : "generated",
    "div" : "<div xmlns="http://www.w3.org/1999/xhtml">xxx</div>"
  },
  "clinicalStatus": {
    "coding": [ {
     "system": "http://hl7.org/fhir/ValueSet/allergyintolerance-clinical",
     "code": "active"
    } ]
  },
  "verificationStatus" : {
    "coding": [ {
     "system": "http://hl7.org/fhir/ValueSet/allergyintolerance-verification",
     "code": "confirmed"
    } ]
  },
  "type" : "allergy", 
  "category" : ["jp_food"], 
  "criticality" : "low", 
  "code" : {
    "coding" : [ {
       "system" : "http://jpfhir.jp/fhir/CodeSystem/***",
       "code" : "J7F7111190",
       "display" : "さば類"
    } ],
    "text" : "ゴマサバ"
  },
  "patient" : {
    "reference" : "Patient/example",
    "display" : "・・・・"
  },
  "onset" : "2021-08-22",
  "recordedDate" : "2021-08-23", 
  "reaction" : [ {
    "manifestation" :　[ {
      "coding" : [ {
         "system" : "http://jpfhir.jp/fhir/CodeSystem/***",
         "code" : "***",
         "display" : "蕁麻疹"
        } ],
      "text" : "じん麻疹"
    } ],
    "severity": "mild"
  } ]
}
```
## 2.1.4.1.5. 注意事項

- 未定

## 2.1.4.1.6. その他、参考文献・リンク等

- 未定



