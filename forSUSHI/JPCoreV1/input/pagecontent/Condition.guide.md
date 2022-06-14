# 2.1.4.2. JP Core Condition （状態） プロファイル

## 2.1.4.2.1. 概要

本プロファイルは、患者の健康状態とその臨床的な評価を表現する`Condition`リソースの記録・更新・検索を行う上で、準拠するべき必須となる要素や、サポートすべき拡張、用語、検索パラメータを定義する。

| 項目           | 内容                                                         |
| -------------- | ---------------------------------------------------------- |
| 定義URL      | http://jpfhir.jp/fhir/core/StructureDefinition/JP_Condition   |
| バージョン     | 1.0.0                       |
| 名前         | JPCoreConditionProfile     |  
| タイトル       | JP Core Condition Profile   |
| ステータス     | アクティブ （2021-11-24）        |
| 定義         | 本プロファイルは`Condition`リソースに対して、患者の健康状態に関するデータを送受信するための共通の制約と拡張を定めたものである。 |
| 公開者        | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| Copyright    | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpcondition  |

### 2.1.4.2.1.1. スコープ

- `Condition`リソースは、患者の健康上の懸念となるレベルに達した、身体的、精神的、社会的な<strong>負</strong>の状態(conditon)や問題（problem／issue）、医療者による診断(diagnosis)、生じたイベント(event)、置かれている状況(situation)、臨床医学的概念(clinical concept)を表現する。
- 健康上の<strong>負の状態</strong>を表すものであるため、"妊娠"のようにそれが正常なものである場合には`Condition`の対象外である。

### 2.1.4.2.1.2. 想定シナリオ

本プロファイルは、以下のようなユースケースを想定する。

- `Condition`リソースの記録・更新・検索。
- 他のリソースからの参照（例：`FamilyMemberHistory`, `Observation`, `Procedure`）

## 2.1.4.2.2. 関連するプロファイル
本プロファイルは、以下のリソースに対して定義された各プロファイルから直接参照される可能性がある。

- [`AdverseEvent`](https://www.hl7.org/fhir/adverseevent.html)
- [`Appointment`](https://www.hl7.org/fhir/appointment.html)
- [`CarePlan`](https://www.hl7.org/fhir/careplan.html)
- ...（その他多数）

## 2.1.4.2.3. リソース定義

[リソース定義ページの参照](https://simplifier.net/jp-core-draftv1/jpcondition)

[リソース定義のダウンロード](https://simplifier.net/jp-core-draftv1/jpcondition/$download?format=json)

{{tree:jp-core-draftv1/jpcondition}}


### 2.1.4.2.3.1. 必須要素
本プロファイルに準拠するためには、次の項目の値が存在しなければならない。

- `code` : 患者が有する状態の種類を示すコード。
- `subject` : 本リソースを有する患者。

### 2.1.4.2.3.2. Extensions定義

- Extensions定義はない

### 2.1.4.2.3.3. 用語定義

| Path                            | 定義                               | バインディング強度 | バリューセット |
| ------------------------------- | ---------------------------------- | ------------------ | -------------- |
|`Condition.clinicalStatus`| 臨床的状態のステータス（アクティブか否かなど）| Required | 1-0.active, 1-1.recurrence, 1-2.relapse, 2-0.inactive, 2-1.remission, 2-2.resolved </br> http://hl7.org/fhir/ValueSet/condition-clinical | 
|`Condition.verificationStatus`|`clinicalStatus` の確からしさ | Required | 1-0.unconfirmed, 1-1.provisional, 1-2.differential, 2.confirmed, 3.refuted, 4.enterd-in-error </br> http://hl7.org/fhir/ValueSet/condition-ver-status |
|`Condition.category`| 本状態のカテゴリ| Required | problem-list-item,encounter-diagnosis,health-concern (US-Core),claim-diagnosis (JP-Core) </br> http://jpfhir.jp/fhir/CodeSystem/*** (予定) |
|`Condition.severity`|本状態の重症度| Required | severe, moderate, mild </br> http://hl7.org/fhir/ValueSet/condition-severity | 
|`Condition.code`|本状態の種類| Example | 未定 |
|`Condition.bodySite`|本状態が存在する人体部位| Example | 未定 |
|`Condition.stage.summary`|本状態の臨床的なステージ（例えば、がんのステージ）| Example | 未定 | 
|`Condition.stage.type`| `stage.summary`の詳細区分。病理的ステージなのか、臨床的ステージなのか、より詳しいものとしてTNM分類なのか、など |Example | 未定 |
|`Condition.evidence.code`|本状態が存在することの根拠となる症状や兆候。例えば、弁膜症という状態の根拠として心雑音など| Example | 未定 |

### 2.1.4.2.3.4. 制約一覧

- 制約はない

## 2.1.4.2.4. 利用方法
### 2.1.4.2.4.1. インタラクション一覧

| コンフォーマンス | インタラクション                            |
| ---------------- | ------------------------------------------- |
| SHALL（必須）    | search-type、read                        |
| SHOULD（推奨）   | vread、history-instance                  |
| MAY（利用可能）  | create、update、patch、delete、history-type |

### 2.1.4.2.4.2. OperationおよびSearch Parameter 一覧
#### 2.1.4.2.4.2.1. Search Parameter一覧

| コンフォーマンス | パラメータ    | 型     | 例                                                           |
| ---------------- | ------------- | ------ | ------------------------------------------------------------ |
| SHALL            | patient    | reference  | GET [base]/Condition?patient=123456 |
| SHALL            | patient,date | reference,date | GET [base]/Condition?patient=123456&date=ge2021-08-24 |
| SHOULD           | patient,clinicalstatus | reference,code | GET [base]/Condition?patient=123456&clinicalstatus=active |
| SHOULD           | patient,verificationstatus | reference,code | GET [base]/Condition?patient=123456&verificationstatus=confirmed |
| SHOULD           | patient,category | reference,code | GET [base]/Condition?patient=123456&category=jp_food |

##### 2.1.4.2.4.2.1.1. 必須検索パラメータ

本プロファイルに準拠するためには、以下の検索パラメータをサポートしなければならない（SHALL）。

1. 検索パラメータ`patient`で指定される患者が有する全ての`Condition`の検索をサポートしなければならない（SHALL）。

   ```http
   GET [base]/Condition?patient={Type/}[id]
   ```
   例：
   ```http
   GET [base]/Condition?patient=123456
   ```
   指定された患者のすべての`Condition`リソースを含むBundleを検索する。

2. 検索パラメータ`patient`と`date`の両者で指定される`Condition`の検索をサポートしなければならない（SHALL）。

  * dateに対する次の比較演算子のサポートを含む: gt,lt,ge,le
  * AND検索のオプションのサポートを含む (例えば.date=[date]&date=[date]]&...)

    ```http
    GET [base]/Condition?patient={Type/}[id]&date={gt|lt|ge|le}[date]{&date={gt|lt|ge|le}[date]&...}
    ```
    例：
    ```http
    GET [base]/Condition?patinet=123456&date=ge2021-08-24
    ```
    指定された患者および日付のすべての`Condition`を含むBundleを検索する。

##### 2.1.4.2.4.2.1.2. 推奨検索パラメータ

次の検索パラメータをサポートすることが推奨(SHOULD)される。

1. 検索パラメータ`patient`と`clinicalstatus`パラメータの組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のサポートを含む(例えば clinicalstatus={system|}[code],{system|}[code],...)

    ```http
    GET [base]/Condition?patient={Type/}[id]&clinicalstatus={system|}[code]{,{system|}[code],...}
    ```

    例：

    ```http
    GET [base]/Condition?patient=123456&clinicalstatus=active
    ```

    ```http
    GET [base]/Condition?patient=123456&clinicalstatus=http://hl7.org/fhir/ValueSet/condition-clinical|active
    ```

    指定された患者およびステータスのすべての`Condition`を含むBundleを検索する。

2. 検索パラメータ`patient`と`verificationstatus`の組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のサポートを含む(例えば verificationstatus={system|}[code],{system|}[code],...)

    ```http
    GET [base]/Condition?patient={Type/}[id]&verificationstatus={system|}[code]{,{system|}[code],...}
    ```

    例：

    ```http
    GET [base]/Condition?patient=123456&verificationstatus=confirmed
    ```

    ```http
    GET [base]/Condition?patient=123456&verificationstatus=http://hl7.org/fhir/ValueSet/http://hl7.org/fhir/ValueSet/condition-ver-status|confirmed
    ```

    指定された患者およびステータスのすべての`Condition`を含むBundleを検索する。

3. 検索パラメータ`patient`と`category`の組み合わせを使用した検索をサポートすることが望ましい（SHOULD）。
  * OR検索のサポートを含む(例えば category={system|}[code],{system|}[code],...)

    ```http
    GET [base]/Condition?patient={Type/}[id]&category={system|}[code]{,{system|}[code],...}
    ```

    例：

    ```http
    GET [base]/Condition?patient=123456&category=claim-diagnosis
    ```

    ```http
    GET [base]/Condition?patient=123456&category=http://jpfhir.jp/fhir/CodeSystem/*** | claim-diagnosis
    ```

    指定された患者およびステータスのすべての`Condition`を含むBundleを検索する。

##### 2.1.4.2.4.2.1.3. オプション検索パラメータ 

- オプション検索パラメータはない

#### 2.1.4.2.4.2.2. Operation一覧

- Operation一覧はない

### 2.1.4.2.4.3. サンプル

```JSON
{
  "resourceType" : "Condition",
  "id" : "example",
  "text" : {
    "status" : "generated",
    "div" : "<div xmlns="http://www.w3.org/1999/xhtml">xxx</div>"
  },
  "clinicalStatus": {
    "coding": [ {
     "system": "http://hl7.org/fhir/ValueSet/condition-clinical",
     "code": "active"
    } ]
  },
  "verificationStatus" : {
    "coding": [ {
     "system": "http://hl7.org/fhir/ValueSet/condition-ver-status",
     "code": "confirmed"
    } ]
  },
  "category": [ {
    "coding": [ {
      "system": "http://jpfhir.jp/fhir/CodeSystem/***",
      "code": "problem-list-item"
    } ]
  } ],
  "severity": {
    "coding": [ {
      "system": "http://hl7.org/fhir/ValueSet/condition-severity",
      "code": "24484000",
      "display": "Severe"
    } ]
  },
  "code": {
    "coding": [ {
    "system": "http://jpfhir.jp/fhir/CodeSystem/***",
      "code": "MK26",
      "display": "ＫＲＡＳ遺伝子野生型結腸癌"
    }, {
    "system": "http://jpfhir.jp/fhir/CodeSystem/***",
      "code": "F833",
      "display": "ＫＲＡＳ遺伝子野生型直腸癌"
    }, {
      "system": "http://jpfhir.jp/fhir/CodeSystem/***",
      "code": "P0A0",
      "display": "転移性大腸腫瘍"
    } ],
    "text" : "KRAS野生型の転移性結腸直腸癌"
  },
  "bodySite": [ {
    "coding": [ {
      "system": "http://jpfhir.jp/fhir/CodeSystem/***",
      "code": "...",
      "display": "結腸"
    }, {
      "system": "http://jpfhir.jp/fhir/CodeSystem/***",
      "code": "...",
      "display": "直腸"
    } ],
    "text" : "結腸直腸"    
  } ],
  "subject" : {
    "reference" : "Patient/example",
    "display" : "・・・"
  },
  "onsetAge": {
    "value": 52,
    "unit": "years",
    "system": "http://unitsofmeasure.org",
    "code": "a"
  },
  "recordedDate": "2020-12-01",
  "evidence": [ {
    "detail": [ {
      "reference": ".../example",
      "display": "..."
    } ]
  } ]
}
```

## 2.1.4.2.5. 注意事項

- 未定

## 2.1.4.2.6. その他、参考文献・リンク等

- 未定

